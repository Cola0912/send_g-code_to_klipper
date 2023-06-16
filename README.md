# send_g_code_to_klipper

このリポジトリは、Klipper 3DプリンターにG-codeを送信するためのシェルスクリプトを提供します。

## 機能

- プリンター名とAPIキーを指定してG-codeを送信
- プリンター名とAPIキーを追加
- プリンター名とAPIキーを削除
- 登録されている全てのプリンター名とAPIキーを表示
- IPアドレスを指定してG-codeを送信（APIキー認証が不要な場合）

## 使い方

### G-codeを送信

```bash
./sendg printer_name "G28"

### APIキーを追加
```bash
./sendg add printer_name "api_key"

### APIキーを削除
./sendg del printer_name
