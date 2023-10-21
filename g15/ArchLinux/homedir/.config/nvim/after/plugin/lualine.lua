-- Set lualine as statusline
-- See `:help lualine.txt`

local function fullbufferpath()
	-- return string.gsub(vim.api.nvim_buf_get_name(0), string.trim(vim.loop.cwd()), '');
	local cwd = vim.fn.getcwd();
	local dname = string.gmatch(cwd, '/(%w+)$')();
	local cwdlen = string.len(cwd);
	local fname = vim.api.nvim_buf_get_name(0);
	local base = string.sub(fname, 0, cwdlen);
	if base == cwd then
		return dname .. string.sub(fname, cwdlen+1);
	end
	return fname
end

require('lualine').setup {
	options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
	},
    
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {fullbufferpath},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {fullbufferpath},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}
