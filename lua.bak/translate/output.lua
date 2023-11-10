local file = require("core.file")
local job = require("core.job")
local text = require("core.text")
local win = require("core.win")
local lua = require("core.lua")
local tree = require("core.tree")
local timer = require("core.timer")

local core = {
	file = file,
	job = job,
	text = text,
	win = win,
	lua = lua,
	tree = tree,
	timer = timer,
}
-- local core = require("core.init")
local static = require("translate.static")

---@param content string
---@param winnr number
---@param pos {row: number, col: number}
local output_in_float_win = function(content, winnr, pos)
	return core.win.open_float_with_text(content, {
		max_height = static.config.output.float.max_height,
		max_width = static.config.output.float.max_width,
		enter = false,
		relative = "win",
		win = winnr,
		bufpos = {
			pos.row - 1,
			pos.col,
		},
		style = "minimal",
		border = "single",
	})
end

local output_notify = function(content)
	vim.notify(content, vim.log.levels.INFO, {
		title = "Translate",
	})
end

local output_to_clipboard = function(content)
	vim.fn.setreg("+", content)
end

local output_insert = core.text.insert

return {
	output_in_float_win = output_in_float_win,
	output_notify = output_notify,
	output_to_clipboard = output_to_clipboard,
	output_insert = output_insert,
}
