local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

require("fidget").setup()

require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local cmp = require('cmp')

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer'}
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'path'}
  }, {
    {name = 'cmdline'}
  })
})

require('user.lsp.null-ls')
