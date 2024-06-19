set relativenumber
set number

set expandtab
set shiftwidth=4
set tabstop=4

set shell=zsh

colorscheme gruvbox

filetype on

nmap <silent> gs <Esc>:syntax sync fromstart<CR>

set foldmethod=indent
set foldlevel=20

" map <Space> <Leader>
" let g:CommandTPreferredImplementation='lua'
"   use 'wincent/command-t'

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-pyright',
  \ 'coc-clangd',
  \ 'coc-r-lsp',
  \ 'coc-java',
  \ 'coc-go'
  \ ]

" Java language server: yay -S jtdls

" Remap for rename current word
nmap <silent> gcr <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gf <cmd>Telescope find_files<cr>
nmap <silent> gb <cmd>Telescope buffers<cr>

nmap <silent> gt <cmd>NERDTreeToggle<cr>

inoremap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<CR>"

set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Fix indentation for R shiny files
autocmd FileType r setl indentexpr=""


lua << EOF
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'dstein64/vim-startuptime'
  use 'morhetz/gruvbox'
  use 'arzg/vim-plan9'
  use 'preservim/nerdtree'
  use {
      'neoclide/coc.nvim',
      branch = 'release'
      }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      requires = { {'nvim-lua/plenary.nvim'} 
      }
}
end)

 require'lspconfig'.pyright.setup{}
EOF

