import numpy as np
import cv2

image_path = r"C:\Users\yuzen sasaoka\OneDrive - 公立大学法人大阪府立大学\デスクトップ\python\画像処理\mask2image.jpg" # 画像のパス
img = cv2.imread(image_path)
gray_image = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

whitePixels = cv2.countNonZero(gray_image)
image_size = img.size
whiteratio = whitePixels/image_size *1000
print("white area = ",whiteratio)