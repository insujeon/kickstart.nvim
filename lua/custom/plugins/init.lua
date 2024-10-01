-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- BUG: Insert 모드에서 ESC 키를 누르면 영어로 전환
--
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   pattern = '*',
--   command = 'silent !fcitx-remote -c', -- 영어 입력 상태로 전환
-- })
--
-- -- Insert 모드로 들어가면 이전 입력 모드(한글)로 복원
-- vim.api.nvim_create_autocmd('InsertEnter', {
--   pattern = '*',
--   command = 'silent !fcitx-remote -o', -- 이전 입력 모드로 복원
-- })
--
-- -- Visual Mode에서는 항상 영어 입력 상태 유지
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   pattern = 'n:v', -- Normal 모드에서 Visual 모드로 변경될 때
--   command = 'silent !fcitx-remote -c', -- 영어 입력 상태로 전환
-- })

return {}
