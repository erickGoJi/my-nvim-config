-- Test for the install script
describe("install script", function()
  it("should exist in the script directory", function()
    local install_script = vim.fn.getcwd() .. "/script/install.sh"
    local stat = vim.loop.fs_stat(install_script)
    assert.is_not_nil(stat, "install.sh should exist")
    assert.equals("file", stat.type, "install.sh should be a file")
  end)

  it("should be executable", function()
    local install_script = vim.fn.getcwd() .. "/script/install.sh"
    local stat = vim.loop.fs_stat(install_script)
    assert.is_not_nil(stat, "install.sh should exist")
    
    -- Check if file has execute permissions (bit 6 for owner)
    local mode = stat.mode
    local owner_execute = bit.band(mode, 64) ~= 0  -- 0100 in octal
    assert.is_true(owner_execute, "install.sh should be executable by owner")
  end)

  it("should have valid bash syntax", function()
    local install_script = vim.fn.getcwd() .. "/script/install.sh"
    local cmd = "bash -n " .. install_script
    local result = vim.fn.system(cmd)
    local exit_code = vim.v.shell_error
    assert.equals(0, exit_code, "install.sh should have valid bash syntax")
  end)

  it("should contain required functions", function()
    local install_script = vim.fn.getcwd() .. "/script/install.sh"
    local content = vim.fn.readfile(install_script)
    local script_content = table.concat(content, "\n")
    
    -- Check for essential functions
    assert.is_true(string.find(script_content, "check_neovim()") ~= nil, "should contain check_neovim function")
    assert.is_true(string.find(script_content, "check_prerequisites()") ~= nil, "should contain check_prerequisites function")
    assert.is_true(string.find(script_content, "backup_existing_config()") ~= nil, "should contain backup_existing_config function")
    assert.is_true(string.find(script_content, "setup_config()") ~= nil, "should contain setup_config function")
    assert.is_true(string.find(script_content, "install_plugins()") ~= nil, "should contain install_plugins function")
  end)
end)