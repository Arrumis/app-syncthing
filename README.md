# app-syncthing

Syncthing を Docker で動かすためのリポジトリです。
設定と同期データを指定した保存先へ置けるため、パソコンを変えても同じ形で使えます。

## 使い方

```bash
cp .env.example .env.local
./scripts/init-data-dirs.sh
docker compose --env-file .env.local up -d
```

ブラウザで開く画面:

- `http://localhost:8384`

## 変更する値

`.env.example` は公開用の見本です。実際の値は `.env.local` に書きます。

- `HOST_DATA_DIR`: Syncthing の設定と同期データを置く場所です。
- `HOSTNAME`: Syncthing の画面に出る名前です。
- `WEB_UI_PORT`: 管理画面の公開ポートです。他サービスと重なるときだけ変えます。
- `APP_SYNCTHING__...`: 親リポジトリからまとめて設定するときに使います。

## データ

GitHub に上げるもの:

- `compose.yaml`
- `.env.example`
- `scripts/`
- `README.md`

GitHub に上げないもの:

- `.env.local`
- `data/config/`
- `data/storage/`

既存環境から移す場合は、旧 `sync` ディレクトリを `HOST_DATA_DIR` に指定します。

## 補足

- 初回起動後の共有フォルダや相手端末の設定は、Syncthing の画面で行います。
- リバースプロキシ連携は親リポジトリ側の設定で扱います。
