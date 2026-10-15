# Neovim チートシート

`<leader>?` で開閉 / `q` で閉じる / 編集して `:w` で保存 / 見出しの上で `za` で畳める
自分で設定したキーは `<leader>` を押して待つと which-key が出す。標準操作の全一覧は `:h quickref`

## 覚えたいこと
<!-- 使って便利だったもの・忘れがちなものをここに書き足す -->

- 

## 検索・置換

- `/foo ?foo`         下 / 上へ検索（n で次、N で前）
- `* #`               カーソル下の単語を下 / 上へ検索
- `:%s/foo/bar/g`     ファイル全体を置換（末尾を gc にすると1件ずつ確認）
- `:s/foo/bar/g`      今の行を置換（ビジュアル選択中なら選択範囲）
- `:g/foo/d`          foo を含む行をすべて削除（:v/foo/d は含まない行）
- `cgn`               検索した語を書き換え → あとは . で次の一致も同じように
- `<C-l>`             検索のハイライトを消す


## ウィンドウ

- `<C-w>s <C-w>v`     横 / 縦に分割
- `<C-w>hjkl`         左 / 下 / 上 / 右のウィンドウへ
- `<C-w>w`            次のウィンドウへ
- `<C-w>q <C-w>o`     今のウィンドウを閉じる / ほかを全部閉じる
- `<C-w>=`            大きさを揃える
- `<C-w>_ <C-w>|`     高さ / 幅を最大に
- `<C-w>T`            今のウィンドウを新しいタブへ

## バッファ・タブ

- `:e {file}`         ファイルを開く
- `<C-^>`             直前のバッファと切り替え
- `]b [b`             次 / 前のバッファ
- `:bd`               バッファを閉じる
- `]q [q`             quickfix の次 / 前の項目
- `gt gT`             次 / 前のタブ
- `:tabnew :tabc`     タブを開く / 閉じる

## 折りたたみ
Markdown は見出し単位、コードはブロック単位（treesitter）

- `za`                開く / 閉じるを切り替え
- `zo zc`             開く / 閉じる
- `zR zM`             すべて開く / すべて閉じる

# プラグイン
<!-- キーを変えたら、ここの該当する節も直す（見出しの横は設定ファイル） -->

## LSP（config/autocmds.lua）

- `gd`                    定義へ（戻るのは <C-o>）
- `gr`                    参照の一覧
- `gi`                    実装へ
- `K`                     ホバー（もう一度押すとフロートの中へ）
- `<leader>rn`            名前の変更
- `<leader>ca`            コードアクション
- `<leader>e`             カーソル位置の診断をフロート表示

## 検索（Telescope：plugins/telescope.lua）

- `<leader>ff`            ファイル検索
- `<leader>fg`            全文検索
- `<leader>fb`            開いているバッファ
- `<leader>fs`            シンボル検索（ワークスペース全体）
- `<leader>fp`            登録ディレクトリへ移動して検索（bookmarks.lua）
- `:Telescope`            ほかのピッカー一覧（keymaps / help_tags / oldfiles など）

### Telescope の画面の中

- `<C-n> <C-p>`           次 / 前の候補
- `<C-x> <C-v> <C-t>`     横分割 / 縦分割 / タブで開く
- `<C-u> <C-d>`           プレビューをスクロール
- `<Tab>`                 複数選択（印を付けて次へ）
- `<C-q>`                 候補をすべて quickfix へ（選択したものだけなら <M-q>）
- `<C-/>`                 キー一覧（ノーマルモードでは ?）
- `<C-c>`                 閉じる（<Esc> はノーマルモードへ）

## ファイラー（oil.nvim：plugins/oil.lua）

- `-`                     親ディレクトリを開く（oil の中でもう一度押すとさらに上へ）

### oil の画面の中
行を編集して :w で確定する（名前の末尾を / にするとディレクトリ）

- `:w`                    行の削除＝削除、名前の書き換え＝リネーム、行の追加＝新規作成
- `dd p`                  別のディレクトリで貼り付けると移動（yy p ならコピー）
- `<CR>`                  開く / ディレクトリに入る
- `<C-s> <C-h> <C-t>`     縦分割 / 横分割 / タブで開く
- `<C-p>`                 プレビュー
- `_`                     作業ディレクトリ（cwd）を開く
- `` ` ``                 このディレクトリに :cd
- `g.`                    隠しファイルの表示切り替え（既定は表示）
- `g?`                    キー一覧

## Git（gitsigns・LazyGit：plugins/gitsigns.lua、lazygit.lua）

- `]c [c`                 次 / 前の変更箇所（hunk）へ
- `<leader>gp`            変更箇所をプレビュー
- `<leader>gs`            変更箇所をステージ
- `<leader>gr`            変更箇所を元に戻す
- `<leader>gb`            この行の blame（コミットの全文）
- `<leader>gg`            LazyGit を開く

### LazyGit の画面の中

- `h l`                   左 / 右のパネルへ
- `<Space> a`             ファイルをステージ・解除 / すべてステージ・解除
- `c`                     コミット
- `P p`                   プッシュ / プル
- `d`                     変更を破棄（確認あり）
- `z`                     直前の操作を取り消す
- `? q`                   キー一覧 / LazyGit を閉じる

## 囲み・括弧（mini.surround・mini.pairs：plugins/editing.lua）
括弧・引用符は挿入モードで自動で閉じる（閉じ側を打つと飛び越え、<BS> で対ごと消える）

- `saiw"`                 単語を " で囲む（sa{motion}{c}。ビジュアル選択中は sa{c}）
- `sd"`                   囲みの " を外す
- `sr"'`                  囲みの " を ' に替える
- `sf) sF)`               次 / 前の ) の囲みへ移動
- `cl`                    1文字消して挿入（s は mini.surround が使うので代わりに）

## 補完（blink.cmp：plugins/completion.lua）

- `<C-space>`             補完を出す / ドキュメントの表示切り替え
- `<C-n> <C-p>`           次 / 前の候補
- `<C-y>`                 確定（<CR> は確定ではなく改行）
- `<C-e>`                 閉じる（入力を元に戻す）
- `<C-b> <C-f>`           ドキュメントをスクロール
- `<Tab> <S-Tab>`         スニペットの次 / 前の入力箇所へ

## デバッグ（nvim-dap・dap-ui：plugins/dap.lua）

- `<F5>`                  開始 / 続行
- `<F10> <F11>`           ステップオーバー / ステップイン
- `<leader>b`             ブレークポイントの切り替え
- `:DapStepOut`           ステップアウト（キーなし）
- `:DapTerminate`         デバッグを終了（キーなし）
- `:DapClearBreakpoints`  ブレークポイントをすべて解除

### dap-ui の画面の中

- `<CR>`                  展開 / 折りたたみ
- `e`                     値を編集
- `o`                     開く（スタックフレームの場所へ）
- `d`                     削除（ウォッチ式・ブレークポイント）
- `t`                     有効 / 無効の切り替え（ブレークポイント）

## .NET（easy-dotnet：plugins/dotnet.lua）

- `<leader>dr`            dotnet run
- `<leader>db`            dotnet build
- `<leader>dt`            テストランナーを開く
- `<leader>ds`            ユーザーシークレットを編集

### テストランナーの画面の中

- `<leader>r <leader>R`   カーソルのテストを実行 / すべて実行
- `<leader>d`             カーソルのテストをデバッグ
- `<leader>p`             失敗したテストのスタックトレース
- `<leader>g`             テストのファイルへ移動
- `]f [f`                 次 / 前の失敗したテストへ
- `o W`                   展開 / すべて折りたたむ
- `<C-r> q`               再読み込み / 閉じる

### テストのファイルの中
テストランナーがテストを見つけたファイルで使える

- `<leader>r <leader>t`   カーソルのテストを実行 / ファイル内のテストをすべて実行
- `<leader>d`             カーソルのテストをデバッグ
- `<leader>p`             テストの出力を表示

## 一覧（Trouble：plugins/editing.lua）

- `<leader>xx`            診断の一覧を開閉
- `<leader>xr`            参照の一覧を開閉

### Trouble の画面の中

- `<CR> o`                ジャンプ / ジャンプして閉じる
- `p`                     プレビュー
- `s gb`                  重大度で絞り込み / 今のバッファだけに絞り込み
- `? q`                   キー一覧 / 閉じる

## which-key（plugins/which-key.lua）

- `<leader>`              押して待つと続きのキーを一覧
- `<BS>`                  1つ前の階層へ
- `<C-d> <C-u>`           一覧をスクロール
- `<Esc>`                 閉じる

## 起動画面（alpha：plugins/alpha.lua）

- `f g r`                 ファイル検索 / 全文検索 / 最近使ったファイル
- `o p`                   ファイラー（oil） / 登録ディレクトリへ移動
- `e q`                   新規ファイル / 終了

## 管理画面（lazy.nvim・Mason・conform）

- `:Lazy`                 プラグイン管理（U 更新、S 同期、X 不要なものを削除、? ヘルプ）
- `:Lazy restore`         lazy-lock.json の版に戻す
- `:Mason`                LSP・フォーマッターの管理（i 入れる、u 更新、X 削除、g? ヘルプ）
- `:ConformInfo`          保存時フォーマットの状態（一度保存したあとに使える）
- `:checkhealth`          不調の切り分け（:checkhealth easy-dotnet など）
