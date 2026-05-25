local gh = function(x)
  return "https://github.com/" .. x
end
--
--require("vim._core.ui2").enable({})

return {
  src = gh("nvim-lualine/lualine.nvim"),
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "terafox",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
  },
}
