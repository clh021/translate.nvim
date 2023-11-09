local config = {
	translate = {
		{
			cmd = "TransToZH",
			command = "trans",
			args = function(trans_source)
				return {
					"-b",
					"-e",
					"bing",
					"-t",
					"zh-CN",
					trans_source,
				}
			end,
			input = "selection",
			output = { "float_win" },
		},
		{
			cmd = "TransToEN",
			command = "trans",
			args = function(trans_source)
				return {
					"-b",
					"-e",
					"bing",
					"-t",
					"en",
					trans_source,
				}
			end,
			input = "input",
			output = { "notify", "clipboard" },
			filter = function(trans_source)
				return trans_source
			end,
		},
	},
	output = {
		float = {
			max_width = 40,
			max_height = 5,
			close_on_cursor_move = true,
			enter_key = "T",
		},
	},
}

return { config = config }
