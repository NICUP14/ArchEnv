-- lua/plugin/telescope.lua

require('nvim-web-devicons').setup {}
require('telescope').setup{
  defaults = {
    prompt_prefix = " ",  -- use a single char to reduce overflow
    results_title = false,
  }
}
