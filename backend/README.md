# Backendコード
## 概要
* D_2201のリポジトリ自体は、CI/CDによって[サーバー](https://lfs-d2201.ashandf.net/)に自動でデプロイされています。
* このBackendディレクトリは、何かしらサーバー上で(定時)実行する必要があるコードを記述しています。

## 導入
1. Pythonのライブラリインストール
    ```
    pip install -r requirements.txt
    ```
2. `.env`ファイルの作成  
    `.env_template`をコピーして作成してください
3. cronの設定
    ```
    crontab -e
    ```
    * `update-cloud.py`  
        ```
        0 */1 * * *
        ```
    * `update-constellation.py`
        ```
        30 */1 * * *
        ```