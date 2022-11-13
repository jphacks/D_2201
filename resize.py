from PIL import Image
import glob, os
import sys
# ------------------------------パラメータ設定設定------------------------------
# 変換したい画像フォーマットを「 png / jpg / webp 」から選択する
img_format = "png"
# 変換前の画像を格納したフォルダ名
original_folder = './docs/data/constellation/'
# 変換後の画像を格納したフォルダ名
conv_folder = './docs/data/constellation_compressed/'
# 画像サイズを指定（h_size = 横幅, v_size = 縦幅）
# 縦横比は維持。指定のサイズに収まるようにリサイズする
# 画像サイズを変えたくない場合は、元画像よりも大きなサイズを指定しておく
h_size = 400 # 変換後の横幅のサイズ
v_size = 400 # 変換後の縦幅のサイズ
# 下記で指定した画像容量になるまで画質調整（画質調整はできるところまで）
Max_size = 200 # KBで指定
# ------------------------------パラメータ設定ここまで------------------------------
# 「 png / jpg / webp 」以外を指定した場合は、終了する。
if not (img_format == 'png' or img_format == 'jpg' or img_format == 'webp'): sys.exit("Error")
# 画像パスを取得
files = glob.glob(original_folder + "*")
# 画像をリサイズ
for file in files:
    file_name = os.path.splitext(os.path.basename(file))[0]
    img = Image.open(file).convert('RGB')
    new_img = img.copy()
    new_img.thumbnail((h_size, v_size))
    new_img_size = os.path.getsize(file) / 1000 # 画質を調整 # png 
    for i in range(7,10): 
        new_img.save(conv_folder + file_name + '.png', compress_level=i)
        new_img_size = os.path.getsize(conv_folder + file_name + '.png') / 1000
        if new_img_size > Max_size and i < 9:
            print(str(new_img_size) + 'KB '+ 'quality=' + str(i))
            os.remove(conv_folder + file_name + '.png')
        else: 
            print('画質調整終了 ' + str(new_img_size) + 'KB '+ 'compress_level=' + str(i))
            break