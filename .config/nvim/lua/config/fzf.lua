local gh = function(x) return 'https://github.com/' .. x end

return {
  src = gh("ibhagwan/fzf-lua"),
  dependencies = { "echasnovski/mini.icons" },
  opts = {}
}
