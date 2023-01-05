require('lualine').setup {
  options = {
		icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
	},
	sections = {
		lualine_a = {
			{
				-- Puts a full path of the file
				'filename',
				path = 1,
			}
		}
	}
}
