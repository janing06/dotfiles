" Mirrors ~/.config/nvim/lua/janing06/{remap,set}.lua.
" Obsidian's vim has no `mapleader` or `xnoremap`: leader is spelled <Space>, visual maps use vnoremap.
" Use noremap below: `:` is swapped with `;`, so a recursive map would turn `:cmd` into `;cmd`.

" ===== Clipboard (vim.opt.clipboard = "unnamedplus") =====
set clipboard=unnamed

" ===== Leader = Space =====
nunmap <Space>
vunmap <Space>

" ===== Clear highlights after searching =====
nnoremap <Esc> :nohlsearch<CR>

" ===== Space + q to open the file explorer (netrw in nvim) =====
exmap explorer obcommand file-explorer:reveal-active-file
nnoremap <Space>q :explorer<CR>

" ===== New line below, stay in normal mode =====
nnoremap <CR> o<Esc>

" ===== Save file with Space + s =====
nnoremap <Space>s :w<CR>

" ===== Disable arrow keys in normal mode =====
" No <Nop> here (it gets typed literally); <Esc> is a no-op in normal mode.
" Insert mode keeps arrows: there is no way to disable them, and right Cmd + hjkl relies on them.
nnoremap <Up> <Esc>
nnoremap <Down> <Esc>
nnoremap <Left> <Esc>
nnoremap <Right> <Esc>

" ===== Remap half-page down/up to J/K =====
nnoremap J <C-d>zz
nnoremap K <C-u>zz
vnoremap J <C-d>zz
vnoremap K <C-u>zz

" ===== Swap : and ; in normal and visual mode =====
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" ===== Prevent losing clipboard when pasting =====
vnoremap <Space>p "_dP
