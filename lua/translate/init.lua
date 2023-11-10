-- nvim -c "set rtp+=."
-- :lua require"translate" -- can output print
print("Hello, started.")

local function lianghong_test_function()
	print("Yeah! Work good!")
end
local function lianghong_run_jest()
	local file = vim.fn.expand("%:p")
	print("now current buffer file fullPath is:" .. file)
	vim.cmd("vsplit | terminal")
	local command = ':call jobsend(b:terminal_job_id, "echo hello world terminal\\n")'
	vim.cmd(command)
end

local function lianghong_test_import()
	-- Test ok
	local luaFunc = require("core.lua").string.split("test", "s")
	print(luaFunc[1])

	-- Test ok
	local luaFunc2 = require("core.lua")
	local res = luaFunc2.string.split("test", "s")
	print(res[1])

	-- Test error
	-- local corelist = require("core") -- error
	local corelist = require("core.init") -- error
	local res2 = corelist.lua.string.split("test", "s")
	print(res2[1])
end

-- -- 增加了浮动窗口的功能
-- local api = vim.api
-- local buf, win
--
-- local function open_window()
-- 	buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
--
-- 	api.nvim_buf_set_option(buf, "bufhidden", "wipe")
--
-- 	-- get dimensions
-- 	local width = api.nvim_get_option("columns")
-- 	local height = api.nvim_get_option("lines")
--
-- 	-- calculate our floating window size
-- 	local win_height = math.ceil(height * 0.8 - 4)
-- 	local win_width = math.ceil(width * 0.8)
--
-- 	-- and its starting position
-- 	local row = math.ceil((height - win_height) / 2 - 1)
-- 	local col = math.ceil((width - win_width) / 2)
--
-- 	-- set some options
-- 	local opts = {
-- 		style = "minimal",
-- 		relative = "editor",
-- 		width = win_width,
-- 		height = win_height,
-- 		row = row,
-- 		col = col,
-- 	}
--
-- 	-- and finally create it with buffer attached
-- 	win = api.nvim_open_win(buf, true, opts)
-- end
-- -- 增加了浮动窗口的功能 - end
--
-- local function update_view()
-- 	-- we will use vim systemlist function which run shell
-- 	-- command and return result as list
-- 	local result = vim.fn.systemlist("git diff-tree --no-commit-id --name-only -r HEAD")
--
-- 	-- with small indentation results will look better
-- 	for k, v in pairs(result) do
-- 		result[k] = "  " .. result[k]
-- 	end
--
-- 	api.nvim_buf_set_lines(buf, 0, -1, false, result)
-- end
-- -- 视图更新 - end
-- local function lianghong_win_test()
-- 	position = 0 -- if you want to preserve last displayed state just omit this line
-- 	open_window()
-- 	set_mappings()
-- 	update_view(0)
-- 	api.nvim_win_set_cursor(win, { 4, 0 }) -- set cursor on first list entry
-- end

-- nvim -c "set rtp+=."
-- :lua require"translate".lianghong_test_function() -- can output function print
return {
	lianghong_test_function = lianghong_test_function,
	lianghong_run_jest = lianghong_run_jest,

	-- lianghong_win_test = lianghong_win_test,
	-- update_view = update_view,
	-- open_file = open_file,
	-- move_cursor = move_cursor,
	-- close_window = close_window,

	lianghong_test_import = lianghong_test_import,
}
