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

-- nvim -c "set rtp+=."
-- :lua require"translate".lianghong_test_function() -- can output function print
return {
	lianghong_test_function = lianghong_test_function,
	lianghong_run_jest = lianghong_run_jest,
}
