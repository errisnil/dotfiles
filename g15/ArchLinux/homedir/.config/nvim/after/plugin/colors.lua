require("catppuccin").setup({
	flavour = "frappe",
	-- transparent_background = true,
	background = {
        light = "latte",
        dark = "frappe",
    },
})
-- vim.cmd[[
-- 	syntax enable
-- 	colorscheme catppuccin
-- ]]

function ColorIt(color)
	color = color or "catppuccin";
	vim.cmd.colorscheme(color);

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalNC", {bg = "none"})
end

ColorIt()
