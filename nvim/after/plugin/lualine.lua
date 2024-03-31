local function copilot_status()
	local client = require("copilot.client")

	local status = "Copilot "

	if client.is_disabled() then
		status = status .. " "
	else
		status = status .. " "
	end

	if not client.buf_is_attached(0) then
		status = status .. " "
	end

	return status
end

require("lualine").setup({
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = { 'filename', copilot_status },
		lualine_x = { 'encoding', 'filesize', 'fileformat', 'filetype' }
	}
})
