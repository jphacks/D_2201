import numpy as np
import cv2

image_path = r"C:\Users\yuzen sasaoka\OneDrive - 公立大学法人大阪府立大学\デスクトップ\python\画像処理\Masked_Osaka_Bay.jpg" # 画像のパス

img = cv2.imread(image_path)

#画像のサイズを小さくする（前処理）
height = img.shape[0]
width = img.shape[1]
resized_img8 = cv2.resize(img,(round(width/5), round(height/5)))
#青を抽出
bgr = [16,31,40]
thresh = 15

#色の閾値
minBGR = np.array([bgr[0] - thresh, bgr[1] - thresh, bgr[2] - thresh])
maxBGR = np.array([bgr[0] + thresh, bgr[1] + thresh, bgr[2] + thresh])

#画像の2値化
maskBGR = cv2.inRange(img,minBGR,maxBGR)
#画像のマスク（合成）
resultBGR = cv2.bitwise_and(img, img, mask = maskBGR)

cv2.imshow("Result BGR", resultBGR)
cv2.imshow("Result mask", maskBGR)

cv2.waitKey(0)
cv2.destroyAllWindows()