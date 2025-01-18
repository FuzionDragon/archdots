return {
  'norcalli/nvim-colorizer.lua',
  require('colorizer').setup {
    'css';
    'javascript';
    'typescript';
    'tsx';
    'jsx';
    'conf';
    html = {
      mode = 'foreground';
    }
  }
}
