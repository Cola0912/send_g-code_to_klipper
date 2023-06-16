#!/bin/bash

# api_keys.confからAPIキーを取得する関数
get_api_key() {
    PRINTER=$1
    API_KEY=$(grep "^$PRINTER" api_keys.conf | cut -d '=' -f2)
    if [ -z "$API_KEY" ]; then
        echo "Error: No API key found for printer $PRINTER"
        exit 1
    fi
    echo $API_KEY
}

# api_keys.confにAPIキーを追加する関数
add_api_key() {
    PRINTER=$1
    API_KEY=$2
    # api_keys.confが存在しない場合は作成
    if [ ! -f api_keys.conf ]; then
        touch api_keys.conf
    fi
    echo "$PRINTER=$API_KEY" >> api_keys.conf
}

# api_keys.confからAPIキーを削除する関数
del_api_key() {
    PRINTER=$1
    sed -i "/^$PRINTER/d" api_keys.conf
}

# api_keys.confから全てのプリンター名とAPIキーを表示する関数
list_api_keys() {
    cat api_keys.conf
}

# コマンドライン引数に基づいて処理を分岐
case $1 in
    "add")
        add_api_key $2 $3
        ;;
    "del")
        del_api_key $2
        ;;
    "list")
        list_api_keys
        ;;
    *)
        PRINTER=$1
        GCODE=$2
        API_KEY=$(get_api_key $PRINTER)
        curl -H "X-Api-Key:$API_KEY" -H "Content-Type: application/json" -X POST -d "{\"script\":\"$GCODE\"}" http://localhost:7125/printer/gcode/script
        ;;
esac
