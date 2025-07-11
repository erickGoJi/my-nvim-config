require('plenary.busted')

describe('vim-options', function()
  before_each(function()
    package.loaded['vim-options'] = nil
    require('vim-options')
  end)

  it('sets mapleader to space', function()
    assert.equals(' ', vim.g.mapleader)
  end)

  it('sets clipboard to unnamedplus', function()
    assert.equals('unnamedplus', vim.o.clipboard)
  end)
end)

