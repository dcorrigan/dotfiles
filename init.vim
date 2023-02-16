set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'ms-jpq/coq_nvim'
Plug 'ms-jpq/coq.artifacts'
Plug 'ms-jpq/coq.thirdparty'
call plug#end()

colorscheme gruvbox

let g:coq_settings = { 'auto_start': v:true }

"+++++++++LSP STUFF+++++++++++++

lua << EOF
local nvim_lsp = require('lspconfig')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
local on_attach = function(client, bufnr)
-- get this to load different file types like gql

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local servers = {'solargraph','tsserver','vuels','graphql','tailwindcss','relay_lsp'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(require('coq').lsp_ensure_capabilities({
    on_attach=on_attach,
  }))
end
EOF
