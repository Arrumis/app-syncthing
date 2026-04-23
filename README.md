# app-syncthing

Syncthing を独立リポジトリとして扱うための新しい正本候補です。旧 installer のテンプレート展開ではなく、repo 単独で起動できる形に寄せています。

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

