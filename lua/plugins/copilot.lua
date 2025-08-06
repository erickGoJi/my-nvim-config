return {
	"github/copilot.vim",
	config = function()
		local uname = vim.loop.os_uname().sysname
		if uname == "Darwin" then
			-- macOS path
			vim.g.copilot_node_command = "/Users/erickeduardogomezjimenez/.nvm/versions/node/v20.18.2/bin/node"
		elseif uname == "Linux" then
			-- Linux path
			local node_path = "/home/eegomezj/.nvm/versions/node/v22.18.0/bin/node"
			if vim.fn.filereadable(node_path) == 1 then
				vim.g.copilot_node_command = node_path
			else
				vim.g.copilot_node_command = "/usr/bin/node"
			end
		else
			-- fallback or error
			vim.g.copilot_node_command = "node"
		end
		vim.g.copilot_filetypes = {
			["*"] = true, -- Enable Copilot for all file types
			["markdown"] = false, -- Disable Copilot for markdown files
			["text"] = false, -- Disable Copilot for text files
			["html"] = false, -- Disable Copilot for HTML files
			["css"] = false, -- Disable Copilot for CSS files
			["javascript"] = true, -- Enable Copilot for JavaScript files
			["typescript"] = true, -- Enable Copilot for TypeScript files
		}
	end,
}
