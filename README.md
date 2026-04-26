# app-syncthing

Syncthing を独立リポジトリとして扱うための新しい正本候補です。旧 installer のテンプレート展開ではなく、repo 単独で起動できる形に寄せています。

## 日本語メモ

GitHub のコミット一覧が英語で分かりにくい場合は、[コミット履歴の日本語メモ](docs/COMMIT_HISTORY_JA.md) を見てください。

## サンプル値の置き換え

`.env.example` は公開用の見本です。実際に使う値は `.env.local` に書きます。

- `HOST_DATA_DIR` は Syncthing の設定と同期データを置く場所へ変更します
- `HOSTNAME` は Syncthing の画面で見分けやすい名前へ変更できます
- `WEB_UI_PORT` や同期ポートは、他サービスと衝突するときだけ変更します
- 親 repo からまとめて使う場合は、`stack.service.env.local` の `GLOBAL__HOST_DATA_ROOT` や `APP_SYNCTHING__...` を使います

## 起動

```bash
cp .env.example .env.local
./scripts/init-data-dirs.sh
docker compose --env-file .env.local up -d
```

ブラウザ:

- Web UI: `http://localhost:8384`

## 管理対象

Git に含めるもの:

- `compose.yaml`
- `.env.example`
- `scripts/`
- `README.md`

Git に含めないもの:

- `.env.local`
- `data/config/`
- `data/storage/`

## データ初期化

```bash
./scripts/init-data-dirs.sh
```

## 補足

- 旧構成の external network / 固定 IP はベース compose から外しています
- reverse proxy 連携が必要なら別 override file で追加する方針です
- 初回起動後の GUI 設定は Syncthing 側で行います
