# send_g-code_to_klipper

このリポジトリは、OS内で動作中のKlipperにG-codeを送信するためのシェルスクリプトを提供します。
IPアドレスをオプションで指定することで同一ネットワーク内の端末からでもG-codeの送信ができます。

## インストール
```bash
cd send_g-code_to_klipper
sudo ./install_sendg.sh
```
//usr/local/bin/sendgとして保存されます。
インストール用シェルスクリプトを実行しなくてもsend_gcode.shを実行ファイルとして使うことで、動作確認ができます。

## 機能

- プリンター名とAPIキーを指定してG-codeを送信
- プリンター名とAPIキーを追加
- プリンター名とAPIキーを削除
- 登録されている全てのプリンター名とAPIキーを表示
- IPアドレスを指定してG-codeを送信（APIキー認証が不要な場合）

## 使い方

### G-codeを送信
```bash
sendg printer_name g28
```

### APIキーを追加
```bash
sendg add printer_name api_key
```
APIキーは/usr/local/bin/api_key.confとして保存されます。

### APIキーを削除
```bash
sendg del printer_name
```
### 登録されている全てのプリンター名とAPIキーを表示
```bash
sendg list
```

### IPアドレスを指定してG-codeを送信
```bash
sendg ip 192.168.1.100 g28
```
別端末で動作中のklipperに対してG-codeを送るときに特に有効

## 注意
* このスクリプトは、Moonrakerがプリンターの7125ポートで動作していると仮定しています。
* api_keys.conf ファイルはスクリプトと同じディレクトリに存在することを前提としています。

## ライセンス
このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

©︎ 2023 Shusei Aida
  
