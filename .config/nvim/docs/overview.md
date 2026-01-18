# Neovim Config Overview

このドキュメントは `~/.config/nvim` の設定概要（人間向け）です。  
AIエージェント向けの編集規約は `AGENTS.md` を参照してください。

---

## 主要設定

### `init.lua`
- `config.lazy` で LazyVim を起動
- Python リモートプラグイン用に `vim.g.python3_host_prog / python_host_prog` を `/opt/homebrew/bin/python3` に固定

### `lua/config/lazy.lua`
- colorscheme を **solarized-osaka** に指定
- LazyVim extras を読み込み  
  - eslint / prettier / biome / copilot / luasnip / rest / mini-hipatterns / octo util / inc-rename
  - markdown / ansible / terraform / docker / typescript / go / python / rust / java / json / tailwind
- `plugins.ui/base/lsp/editor/disable` を import
- RTP から gzip / tar / tohtml / tutor / zip などを無効化
- 更新チェックは有効（通知なし）
- 代替 colorscheme 候補：zenbones / tokyonight / habamax

---

## 一般オプション（`lua/config/options.lua`）

- クリップボード自動連携を無効化（`clipboard=""`）
- `lazyvim_prettier_needs_config=true`（Prettier は設定ファイル必須）
- スペル
  - `spelllang` に `cjk` を追加し日本語を除外
  - 辞書：`spell/en.utf-8.add` と `stdpath("data")/spell/local.utf-8.add`
- ヘルプ日本語化（`helplang=ja`）
  - `H` で右縦分割 help を開く（cabbrev）
- ウィンドウ
  - `splitright/splitbelow`
  - `whichwrap=b,s,h,l,<,>,[,],~`
  - `termguicolors` ON
- 透過
  - `winblend=20`（Cmdline 中は 0 に戻す）
  - `pumblend=10`
  - セパレータ色をハイライトし WinEnter/Leave で切替（neo-tree 除外）
- ターミナル色
  - WezTerm Solarized Dark Higher Contrast に合わせ `terminal_color_0-15` を上書き
- LSP ホバー/シグネチャ枠：角丸

---

## キーマップ（`lua/config/keymaps.lua`）

- 挿入
  - `<C-a>/<C-e>`：行頭/行末
  - `<C-i>` を通常挙動へ戻す
- 算術
  - `+ → <C-a>`、`- → <C-x>`
- タブ/分割/移動/サイズ
  - `<tab>/<s-tab>`：タブ巡回
  - `ss/sv`：分割
  - `sh/sk/sj/sl`：移動
  - `<C-w><矢印>`：リサイズ
- 診断
  - `<C-j>`：次の診断
- Git/ターミナル
  - LazyGit：`<leader>gg`(cwd) / `<leader>gG`(git root)
  - Snacks 端末：`<c-/>`(root) / `<c-_>`(cwd)
  - lazydocker：`<leader>d`（存在時）
- 検索
  - `<leader><leader>`：root からファイル
  - `<leader>/`：root grep（git root 自動判定、dotfiles 時 hidden 表示）
- URL 操作
  - gh URL / AWS ARN / GitHub リポを検出して open 等
  - `gx`：URL/ARN
  - `<leader>gR`：GitHub へ
- 文字列操作
  - `#`：カーソル単語で `:%s/word//g` をセットし置換準備
  - `<leader>say`：say 読み上げ
- スクロール
  - `zz → z`：中央/上/下を 1 秒以内サイクル
- 通知履歴
  - `<leader>nn` に変更

---

## 自動コマンド/ユーザーコマンド（`lua/config/autocmds.lua`）

- SpellCap ハイライト無効化
- 透過維持
  - `apply_transparent_bg` で `Normal/Float/VertSplit/Snacks` を透過
  - BufWritePost / ColorScheme で適用
- Markdown
  - 文字数カウント：`CountCleanTextLength`（記法除去後）→ `<leader>mc`
  - `gd`：`[[notebook:name]]` なら `config.nb` でジャンプ、無ければ LSP
  - Marksman 診断の nb リンク警告を除外
- ヤンク時のみ `"+` へコピー（削除は対象外）
- QuitPre：通常バッファが無ければ特殊ウィンドウのみで終了
- InsertDatetime：日時挿入
- CoAuthoredBy `<github-username>`：gh api から Co-Authored-By 行生成
- CmdlineEnter/Leave で `winblend` を `0/20` 切替

---

## ファイルタイプ検出

- `.mdc` を markdown 扱い
- shebang が `/usr/bin/env zsh` 等なら filetype=zsh

---

## ベース/ツール系プラグイン（概要）

- yazi.nvim：`<leader>y`（現在位置）, `<leader>cw`（cwd）, `<C-Up>`（再開）
- 翻訳
  - vim-translator：`<leader>tj`（日訳、ビジュアルは say で読み上げ）
  - pantran：`<leader>tw`（ウィンドウ）, `<leader>th`（hover 翻訳）
- IME：skkeleton + indicator（denops 必須）
- winresizer：`<leader>wr` / `<C-w>r`
- vimdoc-ja：日本語ヘルプ
- nvim-ufo：Markdown 専用 provider、行数表示、`K` で peek or hover
- baleia.nvim：ANSI 表示 / WezTerm ログ取り込み（WezCapture）
- img-clip.nvim：`<leader>P` 画像貼付（assets に保存）
- snacks.nvim：ダッシュボード / picker / 画像 hover / nb 連携

---

## UI/外観

- Solarized Osaka：透過、斜体、サイドバー暗め、フロート透過、`day_brightness=0.3`
- Incline：上部にパス+ファイル名、`[+]`、カーソル行時非表示
- hlchunk：ブロックガイド（枠線文字、色 `#806d9c`）
- bufferline：nb ノートの場合はタイトル行をタブ名にする

---

## LSP/補完

- nvim-lspconfig：診断 virtual text にサーバ名併記
- nvim-lint：Markdown リンタ無効（CLI rumdl 想定）
- version-lsp：json/toml/gomod/yaml で git root 検出時に自動起動（キャッシュ 24h）
- blink.cmp：枠角丸、`<CR>` で確定しない、cmdline 補完無効、lazydev を Lua で優先
- lazydev：Lua 補完用ライブラリ登録（wezterm-types を lazy インストール）

---

## 編集/言語プラグイン

- Jinja2 / Codic / vim-rfc / vim-sandwich
- tf.nvim：`<leader>Td/Ts/Tv`（Doc/State/Validate）
- emmet-vim：Web ft で `<C-y>` リーダー、lang=ja、2スペース、html5
- mini.surround：`gs*` 系、visual `s`
- minty：`:Shades` / `:Huefy`
- Git：git.nvim / diffview（強カスタム）, code-review は disabled
- テスト：neotest + plenary アダプタ
- 音声入力：vinsert（denops）
- Avante：定義ありだが disabled

---

## その他

- winbar 例はコメントのみ
- `lazy-lock.json` 等は標準ロック
- `lua/plugins/disable.lua` で octo.nvim を開発版へ差し替えつつキーを無効化（enabled=false）

