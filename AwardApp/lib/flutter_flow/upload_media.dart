import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

import '../auth/auth_util.dart';
import 'flutter_flow_util.dart';

const allowedFormats = {'image/png', 'image/jpeg', 'video/mp4', 'image/gif'};

class SelectedMedia {
  const SelectedMedia(this.storagePath, this.bytes);
  final String storagePath;
  final Uint8List bytes;
}

enum MediaSource {
  photoGallery,
  videoGallery,
  camera,
}

Future<List<SelectedMedia>?> selectMediaWithSourceBottomSheet({
  required BuildContext context,
  double? maxWidth,
  double? maxHeight,
  int? imageQuality,
  required bool allowPhoto,
  bool allowVideo = false,
  String pickerFontFamily = 'Roboto',
  Color textColor = const Color(0xFF111417),
  Color backgroundColor = const Color(0xFFF5F5F5),
}) async {
  final createUploadMediaListTile =
      (String label, MediaSource mediaSource) => ListTile(
            title: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                pickerFontFamily,
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            tileColor: backgroundColor,
            dense: false,
            onTap: () => Navigator.pop(
              context,
              mediaSource,
            ),
          );
  final mediaSource = await showModalBottomSheet<MediaSource>(
      context: context,
      backgroundColor: backgroundColor,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!kIsWeb) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ListTile(
                  title: Text(
                    'Choose Source',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      pickerFontFamily,
                      color: textColor.withOpacity(0.65),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  tileColor: backgroundColor,
                  dense: false,
                ),
              ),
              const Divider(),
            ],
            if (allowPhoto && allowVideo) ...[
              createUploadMediaListTile(
                'Gallery (Photo)',
                MediaSource.photoGallery,
              ),
              const Divider(),
              createUploadMediaListTile(
                'Gallery (Video)',
                MediaSource.videoGallery,
              ),
            ] else if (allowPhoto)
              createUploadMediaListTile(
                'Gallery',
                MediaSource.photoGallery,
              )
            else
              createUploadMediaListTile(
                'Gallery',
                MediaSource.videoGallery,
              ),
            if (!kIsWeb) ...[
              const Divider(),
              createUploadMediaListTile('Camera', MediaSource.camera),
              const Divider(),
            ],
            const SizedBox(height: 10),
          ],
        );
      });
  if (mediaSource == null) {
    return null;
  }
  return selectMedia(
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    imageQuality: imageQuality,
    isVideo: mediaSource == MediaSource.videoGallery ||
        (mediaSource == MediaSource.camera && allowVideo && !allowPhoto),
    mediaSource: mediaSource,
  );
}

Future<List<SelectedMedia>?> selectMedia({
  double? maxWidth,
  double? maxHeight,
  int? imageQuality,
  bool isVideo = false,
  MediaSource mediaSource = MediaSource.camera,
  bool multiImage = false,
}) async {
  final picker = ImagePicker();

  if (multiImage) {
    final pickedMediaFuture = picker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
    final pickedMedia = await pickedMediaFuture;
    if (pickedMedia == null || pickedMedia.isEmpty) {
      return null;
    }
    return Future.wait(pickedMedia.asMap().entries.map((e) async {
      final index = e.key;
      final media = e.value;
      final mediaBytes = await media.readAsBytes();
      final path = storagePath(currentUserUid, media.name, false, index);
      return SelectedMedia(path, mediaBytes);
    }));
  }

  final source = mediaSource == MediaSource.camera
      ? ImageSource.camera
      : ImageSource.gallery;
  final pickedMediaFuture = isVideo
      ? picker.pickVideo(source: source)
      : picker.pickImage(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
          source: source,
        );
  final pickedMedia = await pickedMediaFuture;
  final mediaBytes = await pickedMedia?.readAsBytes();
  if (mediaBytes == null) {
    return null;
  }
  final path = storagePath(currentUserUid, pickedMedia!.name, isVideo);
  return [SelectedMedia(path, mediaBytes)];
}

bool validateFileFormat(String filePath, BuildContext context) {
  if (allowedFormats.contains(mime(filePath))) {
    return true;
  }
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text('Invalid file format: ${mime(filePath)}'),
    ));
  return false;
}

Future<SelectedMedia?> selectFile({
  List<String> allowedExtensions = const ['pdf'],
}) async {
  final pickedFiles = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: allowedExtensions,
    withData: true,
  );
  if (pickedFiles == null || pickedFiles.files.isEmpty) {
    return null;
  }

  final file = pickedFiles.files.first;
  if (file.bytes == null) {
    return null;
  }
  final path = storagePath(currentUserUid, file.name, false);
  return SelectedMedia(path, file.bytes!);
}

String storagePath(String uid, String filePath, bool isVideo, [int? index]) {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  // Workaround fixed by https://github.com/flutter/plugins/pull/3685
  // (not yet in stable).
  final ext = isVideo ? 'mp4' : filePath.split('.').last;
  final indexStr = index != null ? '_$index' : '';
  return 'users/$uid/uploads/$timestamp$indexStr.$ext';
}

String signatureStoragePath(String uid) {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  return 'users/$uid/uploads/signature_$timestamp.png';
}

void showUploadMessage(BuildContext context, String message,
    {bool showLoading = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (showLoading)
              Padding(
                padding: EdgeInsetsDirectional.only(end: 10.0),
                child: CircularProgressIndicator(),
              ),
            Text(message),
          ],
        ),
      ),
    );
}
