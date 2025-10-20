return {
  {
    'loctvl842/monokai-pro.nvim',
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true },
        type = { italic = true },
        storageclass = { italic = true },
        structure = { italic = true },
        parameter = { italic = true },
        annotation = { italic = true },
        tag_attribute = { italic = true },
      },
      filter = 'pro',
      day_night = {
        enable = true,
        day_filter = 'pro',
        night_filter = 'spectrum',
      },
      inc_search = 'background',
      background_clear = {
        'telescope',
        'renamer',
        'notify',
        'nvim-tree',
        'bufferline',
      },
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
        indent_blankline = {
          context_highlight = 'default',
          context_start_underline = false,
        },
      },
    },
    config = function(_, opts)
      require('monokai-pro').setup(opts)
      vim.cmd 'colorscheme monokai-pro' -- Comment out to not auto-load
    end,
  },

  {
    'polirritmico/monokai-nightasty.nvim',
    lazy = false,
    priority = 998,
    keys = {
      { '<leader>tt', '<Cmd>MonokaiToggleLight<CR>', desc = 'Monokai-Nightasty: Toggle dark/light theme.' },
    },
    opts = {
      dark_style_background = 'transparent',
      light_style_background = 'transparent',
      markdown_header_marks = true,
      hl_styles = {
        keywords = { italic = true },
        comments = { italic = true },
        floats = 'dark',
      },
      terminal_colors = function(colors)
        return { fg = colors.fg_dark }
      end,
      on_colors = function(colors)
        if vim.o.background == 'light' then
          colors.comment = '#2d7e79'
          colors.lualine.normal_bg = '#7ebd00'
        else
          colors.border = colors.magenta
          colors.lualine.normal_bg = colors.green
        end
      end,
      on_highlights = function(highlights, colors)
        highlights.TelescopeSelection = { bold = true }
        highlights.TelescopeBorder = { fg = colors.grey }
        highlights['@lsp.type.property.lua'] = { fg = colors.fg }
      end,
    },
    config = function(_, opts)
      vim.opt.cursorline = true
      vim.o.background = 'dark'
      require('monokai-nightasty').load(opts)
    end,
  },

  {
    'tanvirtin/monokai.nvim',
    config = function()
      require('monokai').setup { palette = require('monokai').classic }
    end,
  },

  {
    'folke/tokyonight.nvim',
    priority = 998,
    config = function()
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = true },
        },
      }
      -- vim.cmd.colorscheme 'tokyonight-night' -- Set as default
    end,
  },

  {
    'rose-pine/neovim',
    priority = 1000,
    name = 'rose-pine',
    config = function()
      -- Setup default (transparent)
      require('rose-pine').setup {
        variant = 'auto',
        dark_variant = 'main',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        enable = { terminal = true, legacy_highlights = true, migrations = true },
        styles = { italic = true, transparency = true },
        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',
          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',
          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',
        },
        palette = {},
        highlight_groups = {},
      }
    end,
  },
}
