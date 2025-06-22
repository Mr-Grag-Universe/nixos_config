vim.opt.termguicolors = true

function SetColor(color)
	color = color or "tokyonight"
	-- vim.cmd("colorscheme " .. color)
end

SetColor("tokyonight")
