require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      'target'
    },
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')

