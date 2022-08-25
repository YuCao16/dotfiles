--=====================================================
-- Dashborad settings
--=====================================================
local home = os.getenv('HOME')
local db = require('dashboard')
db.custom_header = {
 "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
 "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
 "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
 "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
 "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
 "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
 "                                                      ",
 "                                                      ",
 "                                                      ",
 "           Don‘t forget why you neovim!               ",
 "                                                      ",
}

db.custom_center = {
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'Telescope oldfiles',
  shortcut = 'SPC s o'},
  {icon = '  ',
  desc = 'Recently latest session                 ',
  shortcut = 'SPC s l',
  action ='SessionManager load_last_session'},
  {icon = '  ',
  desc = 'New File                                ',
  action = 'enew',
  shortcut = 'SPC f d'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Change colorscheme                      ',
  action = 'Telescope colorscheme',
  shortcut = 'SPC f d'},
  -- {icon = '  ',
  -- desc = 'Open Personal dotfiles                  ',
  -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
  -- shortcut = 'SPC f d'},
}
