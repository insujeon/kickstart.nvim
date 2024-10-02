-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- PERF: Insert 모드에서 ESC 키를 누르면 영어로 전환
local function switch_to_korean()
  -- 한국어 입력 모드로 전환
  vim.fn.system '/mnt/d/app/im-select.exe 1042'
end
local function switch_between_languages()
  -- 영어 입력 모드로 전환
  vim.fn.system '/mnt/d/app/im-select.exe 1033'
  -- 일정 시간 후 영어로 전환 (1ms 대기)
  vim.defer_fn(switch_to_korean, 1)
end
-- InsertLeave 이벤트가 발생하면 영어로 전환 후 다시 한국어로 전환
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = switch_between_languages,
})

--TODO: Typora Loading with <F10>
-- Function to save the file and open it with Typora
-- Define the function to save the file and open it with Typora
function open_with_typora()
  -- Save the current file
  vim.cmd ':w'

  -- Get the full path of the current file
  local file_path = vim.fn.expand '%:p'

  -- Call Typora from Windows using the full WSL path to Typora
  vim.fn.system('"/mnt/c/Program Files/Typora/Typora.exe" "' .. file_path .. '" &')
end

-- Map <F10> to call the 'open_with_typora' function
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua open_with_typora()<CR>', { noremap = true, silent = true })

return {}
