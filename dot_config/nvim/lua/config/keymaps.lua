vim.keymap.set("n", "<leader>fp", function() require("bookmarks").pick() end, { desc = "登録ディレクトリへ移動" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "診断をフロート表示" })

-- cheatsheet.md をフロートで開閉する。q でも閉じる。その場で編集して :w で保存できる
local cheatsheet_win
vim.keymap.set("n", "<leader>?", function()
  if cheatsheet_win and vim.api.nvim_win_is_valid(cheatsheet_win) then
    vim.api.nvim_win_close(cheatsheet_win, false)
    return
  end
  local width = math.min(110, math.floor(vim.o.columns * 0.9))
  local height = math.floor(vim.o.lines * 0.85)
  local scratch = vim.api.nvim_create_buf(false, true)
  vim.bo[scratch].bufhidden = "wipe" -- 下の :edit で置き換えたら消える
  cheatsheet_win = vim.api.nvim_open_win(scratch, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = "rounded",
    title = " チートシート ",
    title_pos = "center",
  })
  -- :edit で開くと filetype の判定と treesitter（見出し単位の折りたたみ）が効く
  vim.cmd.edit(vim.fn.fnameescape(vim.fn.stdpath("config") .. "/cheatsheet.md"))
  vim.bo.buflisted = false -- :ls や Telescope のバッファ一覧に出さない
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, nowait = true })
end, { desc = "チートシート" })
