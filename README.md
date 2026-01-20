# dotfiles

macOS 上の `~/.config` 配下の設定（Neovim / WezTerm / AeroSpace / Vim / zsh/rc）を、このリポジトリで管理します。  
**シンボリックリンクは使わず**、`rsync` による **実体コピー**で運用します。

> 参考: mozumasu さんの dotfiles を参考に構成・運用を整えました  
> https://github.com/mozumasu/dotfiles/tree/main

---

## 管理対象

このリポジトリでは以下を管理します。

- `~/.config/lazygit/`
- `~/.config/nvim/`
- `~/.config/wezterm/`
- `~/.config/aerospace/`
- `~/.config/vim/`
- `~/.config/zsh/rc/`

---

## ディレクトリ構成

```

├── .bin/                # 運用スクリプト（apply/sync/doctor 等）
├── .config/             # 管理対象の設定ファイル（~/.config と同構造）
│   ├── lazygit/
│   ├── nvim/
│   ├── wezterm/
│   ├── aerospace/
│   ├── vim/
│   └── zsh/
│       └── rc/
├── Taskfile.yml         # task コマンドの入口
└── .gitignore           # ホワイトリスト方式

```

---

## 前提

- macOS
- `ghq` 運用（`~/src` 配下などにリポジトリを置く）
- `task`（go-task）
- `rsync`

### 必要ツールのインストール例（Homebrew）

```
brew install ghq rsync
brew install go-task/tap/go-task
```

---

## セットアップ（新しい環境に反映）

1. リポジトリを取得（ghq 前提）

```
ghq get git@github.com:take0fit/dotfiles.git
cd "$(ghq root)/github.com/take0fit/dotfiles"
```

2. 反映

```
task apply
```

---

## 取り込み（いまの ~/.config を repo にコピー）

手元の設定をリポジトリに取り込みます。

```
task sync

```

差分確認：

```
task status
task diff
```

コミット：

```
task commit MSG="sync configs"
git push

```

---

## よく使うコマンド

- スクリプト実行権限の自動付与（sync/apply 前に走る）
  - `task bin:chmod`
- 必須コマンド確認
  - `task doctor`
- ローカル → repo 取り込み
  - `task sync`
- repo → ローカル 反映
  - `task apply`

---

## 注意（ホワイトリスト運用）

`.gitignore` は **基本すべて無視**し、必要な設定のみ許可するホワイトリスト方式です。  
管理対象を増やす場合は `.gitignore` に許可ルールを追加してください。

また、トークンや認証情報など **秘密情報が含まれるファイルはコミットしない**よう注意してください。

---

## Thanks

mozumasu さんの dotfiles（上記リンク）を参考に、各利用ツールの設定ファイルを作成しました。感謝です🐈
