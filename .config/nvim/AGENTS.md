# Neovim Config — Agent Guide (AGENTS.md)

## 目的 / ゴール
この Neovim 設定は、以下を安定して成立させることを目的とします。

- LazyVim をベースにした拡張（Extras + 独自プラグイン）
- Solarized Osaka を前提にした UI（透過 / ハイライト / ターミナル色）
- nb 連携（ノート検索・リンク・画像処理）
- denops 前提の機能（IME / 音声入力など）

## 変更の原則（必須）
- **最小差分**：既存の挙動を壊さない。意図が不明なら「削除」より「無効化」。
- **分離**：オプション/キーマップ/自動コマンド/プラグインは既存ファイルの責務に従う。
- **互換性**：macOS + Homebrew + WezTerm 前提がある（terminal_color_* / python host など）。

## 触る時に特に注意する領域（壊れやすい）
- 透過：`winblend/pumblend` と WinEnter/Leave のハイライト切替（neo-tree 除外など）
- ヤンクのみ `"+` 同期（削除は対象外）
- WezTerm Solarized Dark Higher Contrast に合わせた `terminal_color_0-15`
- Markdown の nb リンク解決（`[[notebook:name]]` → `config.nb` → fallback LSP）
- denops が必要なプラグイン（skkeleton / vinsert など）

## 追加・変更の配置ルール
- 起動入口：`init.lua`
- LazyVim / Extras / import：`lua/config/lazy.lua`
- 一般オプション：`lua/config/options.lua`
- キーマップ：`lua/config/keymaps.lua`
- 自動コマンド/ユーザーコマンド：`lua/config/autocmds.lua`
- 追加プラグイン：`lua/plugins/*.lua`
- 無効化・差し替え：`lua/plugins/disable.lua`

## 変更後のチェック（最低限）
- 起動できること（エラーなし）
- `:Lazy` / `:Lazy sync` が通ること
- 主要キーマップ：検索 / Git / ターミナル / nb / Markdown
- denops 系：skkeleton / vinsert が動くこと（依存が満たされていること）

