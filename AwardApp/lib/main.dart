import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import '../globals.dart' as globals;
import 'package:flutter/services.dart';

void main() async {
  int count = 0;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();
  FFAppState(); // Initialize FFAppState
  rootBundle.loadString('assets/csv/osaka-score.csv').then((String csv) {
    for (String line in csv.split('\n')) {
      List rows = line.split(','); // split by comma
      if (rows[0] != "index") {
        if (int.parse(rows[0]) % 2 == 0) {
          globals.csvlist.add(rows);
          count++;
        }
      }
    }
    // print(count);
  });

  //print(globals.csvlist);
  http.Response response = await http.get(
      Uri.https('lfs-d2201.ashandf.net', '/data/cloud_all_latest_level2.csv'));

  if (response.statusCode != 200) {
    print('ERROR: ${response.statusCode}');
    return;
  }
  String? str = response.body.toString();
  //print(str);
  int count = -1;
  for (String line in str.split('\n')) {
    List rows = line.split(','); // split by comma
    if (count != -1) {
      // print(count);
      // print(rows);
      if (count % 2 == 0) {
        globals.cloudslist.add(rows);
      }
    }
    count++;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<JphacksFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = jphacksFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'jphacks',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'homePage_MAIN';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'homePage_MAIN': HomePageMAINWidget(),
      'Want': WantWidget(),
      'Maps': MapsWidget(),
      'Starmaps': StarmapsWidget(),
      'profilePage': ProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).grayIcon,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              size: 24,
            ),
            label: 'My Trips',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.map_sharp,
              size: 24,
            ),
            label: 'Maps',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.star_rate,
              size: 24,
            ),
            label: 'Astronomic',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              size: 24,
            ),
            label: 'Profile',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
