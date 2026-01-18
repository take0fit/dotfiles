# Reference

このファイルは「一覧で探したい」ための参照用です。

---

## キーマップ表（カスタム設定のみ）

### Insert / 基本
- `<C-a>`：行頭
- `<C-e>`：行末
- `<C-i>`（n/i）：通常ジャンプ挙動へ戻す

### 数値
- `+ → <C-a>`：インクリメント
- `- → <C-x>`：デクリメント

### Tabs
- `<tab>`：次タブ
- `<s-tab>`：前タブ

### Split / Move / Resize
- `ss`：横分割
- `sv`：縦分割
- `sh/sk/sj/sl`：ウィンドウ移動
- `<C-w><←/→/↑/↓>`：リサイズ

### Diagnostics
- `<C-j>`：次の診断

### Git / Terminal
- `<leader>gg`：LazyGit（cwd）
- `<leader>gG`：LazyGit（git root）
- `<c-/>`：Snacks terminal（root）
- `<c-_>`：Snacks terminal（cwd）
- `<leader>d`：lazydocker（存在時）

### Search
- `<leader><leader>`：git root からファイル検索
- `<leader>/`：git root grep（dotfiles 時 hidden）

### URL / Link
- `gx`：URL/ARN をブラウザ
- `<leader>gR`：GitHub リポを開く
- （gh URL / AWS ARN / GitHub リポ検出→open 等）

### Replace / Utility
- `#`：カーソル単語で `:%s/...//g` テンプレ生成 + 置換準備
- `<leader>say`：say で読み上げ

### Scroll
- `zz`：中央化
- `z`：中央/上/下を 1 秒以内サイクル

### Notifications
- `<leader>nn`：Snacks 通知履歴

### Markdown
- `<leader>mc`：記法除去後の文字数カウント（markdown ローカル）

### File Manager
- `<leader>y`：yazi（現在位置）
- `<leader>cw`：yazi（cwd）
- `<C-Up>`：yazi 再開

### Translate
- vim-translator
  - `<leader>tj`（n）：ポップアップ日訳
  - `<leader>tj`（v）：選択日訳 + say
- pantran
  - `<leader>tw`（n）：翻訳ウィンドウ
  - `<leader>th`（n）：hover 翻訳
  - （v は選択→hover/say）

### Window Resizer
- `<leader>wr`：WinResizer
- `<C-w>r`：WinResizer

### Snacks
- `<leader>mp`：画像/数式 hover（png/markdown）
- `<leader>p`：picker 一覧
- `<space>fh`：help picker（Enter で垂直分割）

### nb
- `<leader>na`：追加（現在ノートブック推測）
- `<leader>nA`：ノートブック選択して追加
- `<leader>ni`：画像インポート + リンク挿入
- `<leader>nl`：ノート/画像リンク挿入
- `<leader>nm`：ノート移動
- `<leader>np`：ノート一覧 + 削除
- `<leader>ng`：ノート grep

### Fold (nvim-ufo)
- `zR`：全開
- `zM`：全閉
- `zr/zm`：段階開閉
- `K`：fold peek / LSP hover

### Terraform (tf.nvim)
- `<leader>Td`：Doc
- `<leader>Ts`：State
- `<leader>Tv`：Validate（terraform/hcl）

### Git tools
- `<leader>go`：git.nvim browse マッピング初期化
- `<leader>gd`：Diffview toggle（内部キーマップ多数カスタム）

### Images
- `<leader>P`：img-clip（クリップボード画像 → assets 保存）

### Surround
- mini.surround：`gsa/gsd/gsf/gsF/gsh/gsr/gsn`、visual `s`

### Voice input (vinsert)
- Insert mode `<C-.>`：録音トグル
- `<C-w>`：録音中 Cancel

### Clipboard
- TextYankPost：yank のみ `"+` 同期（削除は対象外）

---

## プラグイン表（主要追加・上書き）

### LazyVim / Extras
- LazyVim本体 + Extras
  - eslint / prettier / biome / copilot / luasnip / rest / mini-hipatterns / octo util / inc-rename
  - markdown / ansible / terraform / docker / typescript / go / python / rust / java / json / tailwind

### Colorscheme / UI
- `craftzdog/solarized-osaka.nvim`（デフォルト）
- `b0o/incline.nvim`（ファイル名バー）
- `shellRaining/hlchunk.nvim`（ブロックガイド）
- `akinsho/bufferline.nvim`（nb タイトル表示）
- optional：tokyonight / kanagawa-paper / zenbones / catppuccin / gruvbox（多くは disabled）

### File / Clip
- `mikavilpas/yazi.nvim`（ファイラ）
- `HakonHarnes/img-clip.nvim`（画像貼付）

### Translate
- `voldikss/vim-translator`
- `potamides/pantran.nvim`

### IME / denops
- `vim-skk/skkeleton`
- `delphinus/skkeleton_indicator.nvim`

### Help
- `vim-jp/vimdoc-ja`

### Window
- `simeji/winresizer`

### Folding
- `kevinhwang91/nvim-ufo` + `promise-async`

### ANSI / WezTerm
- `m00qek/baleia.nvim`（ANSI レンダ、WezCapture）

### Dashboard / Picker / Image / nb
- `folke/snacks.nvim`（dashboard / picker / 画像 hover / nb 拡張）
- `lua/config/nb.lua`（nb コマンドラッパ）

### LSP / Completion
- `neovim/nvim-lspconfig`（診断表示変更、version-lsp 起動）
- `mfussenegger/nvim-lint`（Markdown 無効）
- `saghen/blink.cmp`（角丸、Enter 無効、cmdline off、lazydev 優先）
- `folke/lazydev.nvim`
- `justinsgithub/wezterm-types`（lazy インストール）

### Language / Editing
- `Glench/Vim-Jinja2-Syntax`
- `koron/codic-vim`
- `mhinz/vim-rfc`
- `machakann/vim-sandwich`
- `allaman/tf.nvim`
- `mattn/emmet-vim`
- `nvim-mini/mini.surround`
- `nvzone/volt` + `nvzone/minty`

### Git
- `dinhhuy258/git.nvim`
- `sindrets/diffview.nvim`（詳細キーマップ付）
- `pwntester/octo.nvim`（disable / 開発版コメント参照）
- `choplin/code-review.nvim`（定義のみ / disabled）

### Test
- `nvim-neotest/neotest`
- `neotest-plenary/nvim-nio`

### Voice input (denops)
- `yuki-yano/vinsert.vim`（OPENAI_API_KEY, ffmpeg avfoundation, progressive STT など）

### Disabled
- `yetone/avante.nvim`（enabled=false）

