local M = {}
-- A slightly altered version of catppucchin mocha
local mocha = {
   rosewater = '#f5e0dc',
   flamingo = '#f2cdcd',
   pink = '#f5c2e7',
   mauve = '#cba6f7',
   red = '#f38ba8',
   maroon = '#eba0ac',
   peach = '#fab387',
   yellow = '#f9e2af',
   green = '#a6e3a1',
   teal = '#94e2d5',
   sky = '#89dceb',
   sapphire = '#74c7ec',
   blue = '#89b4fa',
   lavender = '#b4befe',
   text = '#cdd6f4',
   subtext1 = '#bac2de',
   subtext0 = '#a6adc8',
   overlay2 = '#9399b2',
   overlay1 = '#7f849c',
   overlay0 = '#6c7086',
   surface2 = '#585b70',
   surface1 = '#45475a',
   surface0 = '#313244',
   base = '#1f1f28',
   mantle = '#181825',
   crust = '#11111b',
}
-- {base00: "#282c34"
-- base01: "#353b45"
-- base02: "#3e4451"
-- base03: "#545862"
-- base04: "#565c64"
-- base05: "#abb2bf"
-- base06: "#b6bdca"
-- base07: "#c8ccd4"
-- base08: "#e06c75"
-- base09: "#d19a66"
-- base0A: "#e5c07b"
-- base0B: "#98c379"
-- base0C: "#56b6c2"
-- base0D: "#61afef"
-- base0E: "#c678dd"
-- base0F: "#be5046"}
local latte = {
   rosewater = '#dc8a78',
   flamingo = '#dd7878',
   pink = '#ea76cb',
   mauve = '#8839ef',
   red = '#d20f39',
   maroon = '#e64553',
   peach = '#fe640b',
   yellow = '#df8e1d',
   green = '#40a02b',
   teal = '#179299',
   sky = '#04a5e5',
   sapphire = '#209fb5',
   blue = '#1e66f5',
   lavender = '#7287fd',
   text = '#4c4f69',
   subtext1 = '#5c5f77',
   subtext0 = '#6c6f85',
   overlay2 = '#7c7f93',
   overlay1 = '#8c8fa1',
   overlay0 = '#9ca0b0',
   surface2 = '#acb0be',
   surface1 = '#bcc0cc',
   surface0 = '#ccd0da',
   crust = '#dce0e8',
   mantle = '#e6e9ef',
   base = '#eff1f5',
}
local frappe = {
   rosewater = '#f2d5cf',
   flamingo = '#eebebe',
   pink = '#f4b8e4',
   mauve = '#ca9ee6',
   red = '#e78284',
   maroon = '#ea999c',
   peach = '#ef9f76',
   yellow = '#e5c890',
   green = '#a6d189',
   teal = '#81c8be',
   sky = '#99d1db',
   sapphire = '#85c1dc',
   blue = '#8caaee',
   lavender = '#babbf1',
   text = '#c6d0f5',
   subtext1 = '#b5bfe2',
   subtext0 = '#a5adce',
   overlay2 = '#949cbb',
   overlay1 = '#838ba7',
   overlay0 = '#737994',
   surface2 = '#626880',
   surface1 = '#51576d',
   surface0 = '#414559',
   base = '#303446',
   mantle = '#292c3c',
   crust = '#232634',
}
local macchiato = {
   rosewater = '#f4dbd6',
   flamingo = '#f0c6c6',
   pink = '#f5bde6',
   mauve = '#c6a0f6',
   red = '#ed8796',
   maroon = '#ee99a0',
   peach = '#f5a97f',
   yellow = '#eed49f',
   green = '#a6da95',
   teal = '#8bd5ca',
   sky = '#91d7e3',
   sapphire = '#7dc4e4',
   blue = '#8aadf4',
   lavender = '#b7bdf8',
   text = '#cad3f5',
   subtext1 = '#b8c0e0',
   subtext0 = '#a5adcb',
   overlay2 = '#939ab7',
   overlay1 = '#8087a2',
   overlay0 = '#6e738d',
   surface2 = '#5b6078',
   surface1 = '#494d64',
   surface0 = '#363a4f',
   base = '#24273a',
   mantle = '#1e2030',
   crust = '#181926',
}

M.colorscheme = function(color_scheme)
   local color_schemes = {
      mocha = mocha,
      latte = latte,
      frappe = frappe,
      macchiato = macchiato,
   }

   local color = color_schemes[color_scheme]

   if not color then
      error('Invalid color scheme: ' .. tostring(color_scheme))
   end

   return {
      foreground = color.text,
      background = color.base,
      cursor_bg = color.rosewater,
      cursor_border = color.rosewater,
      cursor_fg = color.crust,
      selection_bg = color.surface2,
      selection_fg = color.text,
      ansi = {
         '#0C0C0C', -- black
         '#C50F1F', -- red
         '#13A10E', -- green
         '#C19C00', -- yellow
         '#0037DA', -- blue
         '#881798', -- magenta/purple
         '#3A96DD', -- cyan
         '#CCCCCC', -- white
      },
      brights = {
         '#767676', -- black
         '#E74856', -- red
         '#16C60C', -- green
         '#F9F1A5', -- yellow
         '#3B78FF', -- blue
         '#B4009E', -- magenta/purple
         '#61D6D6', -- cyan
         '#F2F2F2', -- white
      },
      tab_bar = {
         background = 'rgba(0, 0, 0, 0.4)',
         active_tab = {
            bg_color = color.surface2,
            fg_color = color.text,
         },
         inactive_tab = {
            bg_color = color.surface0,
            fg_color = color.subtext1,
         },
         inactive_tab_hover = {
            bg_color = color.surface0,
            fg_color = color.text,
         },
         new_tab = {
            bg_color = color.base,
            fg_color = color.text,
         },
         new_tab_hover = {
            bg_color = color.mantle,
            fg_color = color.text,
            italic = true,
         },
      },
      visual_bell = color.surface0,
      indexed = {
         [16] = color.peach,
         [17] = color.rosewater,
      },
      scrollbar_thumb = color.surface2,
      split = color.overlay0,
      compose_cursor = color.flamingo, -- nightbuild only
   }
end
return M
