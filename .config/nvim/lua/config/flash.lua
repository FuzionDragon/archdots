local flash = require("flash")
flash.setup({
  modes = {
    -- Enhanced f, t, F, T motions
    char = {
      enabled = true,
      jump_labels = true,
    },
  },
})
