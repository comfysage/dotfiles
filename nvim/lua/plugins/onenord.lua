return {
  { 'rmehri01/onenord.nvim', lazy = true,
    config = function()
      local status, _ = pcall(require, 'onenord')
      if not status then return end

      require 'onenord.config'.set_options {
        styles = {
          diagnostics = "NONE"
        },
        disable = {
          eob_lines = false
        },
        custom_colors = {
          bg = "#2d3442"
        }
      }
    end
  }
}
