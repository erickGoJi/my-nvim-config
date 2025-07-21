return {
	"github/copilot.vim",
	config = function()
		local uname = vim.loop.os_uname().sysname
		if uname == "Darwin" then
			-- macOS path
			vim.g.copilot_node_command = "/Users/erickeduardogomezjimenez/.nvm/versions/node/v20.18.2/bin/node"
		elseif uname == "Linux" then
			-- Linux path
			vim.g.copilot_node_command = "/home/eegomezj/.nvm/versions/node/v20.18.2/bin/node"
		else
			-- fallback or error
			vim.g.copilot_node_command = "node"
		end
	end,
}
