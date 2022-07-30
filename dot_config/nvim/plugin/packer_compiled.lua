-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/caoyu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/caoyu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/caoyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/caoyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/caoyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\0\a\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\b\0005\5\4\0005\6\3\0=\6\5\0055\6\6\0=\6\a\5=\5\t\4=\4\v\3B\1\2\1K\0\1\0\nmodes\1\0\0\rataraxis\1\0\0\14custom_bg\1\2\0\0\f#1e222a\29ideal_writing_area_width\1\0\1\29disable_bg_configuration\1\1\2\0\0\3\0\nsetup\rtrue-zen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["animate.vim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/animate.vim",
    url = "https://github.com/camspiers/animate.vim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nâ\2\0\0\4\0\n\0\0165\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2'\2\5\0&\1\2\1=\1\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\17auto-session\frequire\26auto_session_root_dir\14/session/\tdata\fstdpath\afn\bvim\1\0\5\22auto_save_enabled\1\25auto_restore_enabled\1\14log_level\tinfo%auto_session_enable_last_session\1\25auto_session_enabled\2\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["ayu-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["bufdelete.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\18close_command\rBdelete!\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["cutlass.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcut_key\6c\nsetup\fcutlass\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/cutlass.nvim",
    url = "https://github.com/gbprod/cutlass.nvim"
  },
  ["dap-buddy.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/dap-buddy.nvim",
    url = "https://github.com/Pocco81/dap-buddy.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  edge = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/edge",
    url = "https://github.com/sainnhe/edge"
  },
  everforest = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fold-preview.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/fold-preview.nvim",
    url = "https://github.com/anuvyklack/fold-preview.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vborder\vdouble\nsetup\tglow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["gruvbox-material"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["headlines.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n¢\a\0\0\4\0\24\00046\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\3\0'\2\6\0B\0\2\0016\0\0\0009\0\3\0'\2\a\0B\0\2\0016\0\0\0009\0\3\0'\2\b\0B\0\2\0016\0\0\0009\0\3\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0009\0\v\0\18\2\0\0009\0\f\0'\3\r\0B\0\3\0016\0\14\0'\2\15\0B\0\2\0029\0\16\0005\2\17\0005\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\24char_highlight_list\1\a\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent3\27IndentBlanklineIndent4\27IndentBlanklineIndent5\27IndentBlanklineIndent6\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\3\0\0\14dashboard\18lsp-installer\1\0\1\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\feol:‚Ü¥\vappend\14listchars\tlistAhighlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombineAhighlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombineAhighlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombineAhighlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombineAhighlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombineAhighlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine\bcmd\18termguicolors\bopt\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupytext.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/jupytext.vim",
    url = "https://github.com/goerz/jupytext.vim"
  },
  ["keymap-amend.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/keymap-amend.nvim",
    url = "https://github.com/anuvyklack/keymap-amend.nvim"
  },
  ["latexindent.pl"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/latexindent.pl",
    url = "https://github.com/cmhughes/latexindent.pl"
  },
  ["leetcode.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/leetcode.vim",
    url = "https://github.com/ianding1/leetcode.vim"
  },
  ["lens.vim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/lens.vim",
    url = "https://github.com/camspiers/lens.vim"
  },
  ["limelight.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  monokai_transparent = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/monokai_transparent",
    url = "https://github.com/yucao16/monokai_transparent"
  },
  ["nabla.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  neoformat = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neomake = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/neomake",
    url = "https://github.com/neomake/neomake"
  },
  neorg = {
    config = { "\27LJ\2\n‰\1\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\2\thome\17~/notes/home\twork\17~/notes/work\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neovim = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18autoload_mode\1\nsetup\20session_manager\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nord-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\ny\0\0\2\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\3Ä-\0\0\0009\0\4\0D\0\1\0K\0\1\0\1¿\17autopairs_cr\24coc#_select_confirm\15pumvisible\afn\bvim\0¸\1\1\0\b\0\15\0\0236\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\0029\2\5\0015\4\6\0B\2\2\0016\2\a\0004\3\0\0=\3\b\0026\2\b\0003\3\n\0=\3\t\2\18\2\0\0'\4\v\0'\5\f\0'\6\r\0005\a\14\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\fnoremap\2\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\0\23completion_confirm\vMUtils\a_G\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\2\n|\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0D/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9\nsetup\15dap-python\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-hlslens"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-keymap-amend"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-keymap-amend",
    url = "https://github.com/anuvyklack/nvim-keymap-amend"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-peekup"] = {
    config = { "\27LJ\2\nW\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\1\4\0=\1\3\0K\0\1\0\n100ms\ndelay\17on_keystroke\23nvim-peekup.config\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-transparent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nå\2\0\0\5\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\a\0025\3\14\0005\4\r\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\2\18resize_window\1\17quit_on_open\1\1\0\1\nwidth\3\30\bgit\1\0\2\vignore\2\venable\2\ffilters\1\0\1\rdotfiles\2\tview\1\0\1\21hide_root_folder\1\15auto_close\tture\1\0\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["onedarkpro.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\nˇ\1\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fsymbols\15checkboxes\tdone\1\3\0\0\b‚úì\fOrgDone\ttodo\1\3\0\0\b‚òê\fOrgTODO\14cancelled\1\0\0\1\3\0\0\bÔá∏\17OrgCancelled\14headlines\1\0\0\1\5\0\0\b‚óâ\b‚óã\b‚ú∏\b‚úø\1\0\1\18concealcursor\2\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["sidebar.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fsymbols\1\0\1\ticon\a∆í\rsections\1\0\0\1\5\0\0\rdatetime\bgit\fsymbols\ntodos\nsetup\17sidebar-nvim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/sidebar.nvim",
    url = "https://github.com/sidebar-nvim/sidebar.nvim"
  },
  sniprun = {
    config = { "\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20display_options\1\0\1\25notification_timeout\3\n\fdisplay\1\0\0\1\2\0\0\15NvimNotify\nsetup\fsniprun\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  sonokai = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16spellsitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["substitute.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15substitute\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  tabular = {
    after_files = { "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tagbar = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-heading.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fheading\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["train.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/train.nvim",
    url = "https://github.com/tjdevries/train.nvim"
  },
  vim = {
    after_files = { "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim/after/plugin/dracula.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim",
    url = "https://github.com/dracula/vim"
  },
  ["vim-be-good"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-code-dark"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-illuminate"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-monokai"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-monokai",
    url = "https://github.com/sickill/vim-monokai"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nwidth\4\0ÄÄ†ˇ\3\nsetup\rzen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/caoyu/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\nˇ\1\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fsymbols\15checkboxes\tdone\1\3\0\0\b‚úì\fOrgDone\ttodo\1\3\0\0\b‚òê\fOrgTODO\14cancelled\1\0\0\1\3\0\0\bÔá∏\17OrgCancelled\14headlines\1\0\0\1\5\0\0\b‚óâ\b‚óã\b‚ú∏\b‚úø\1\0\1\18concealcursor\2\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18autoload_mode\1\nsetup\20session_manager\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: nvim-peekup
time([[Config for nvim-peekup]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\1\4\0=\1\3\0K\0\1\0\n100ms\ndelay\17on_keystroke\23nvim-peekup.config\frequire\0", "config", "nvim-peekup")
time([[Config for nvim-peekup]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\ny\0\0\2\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\3Ä-\0\0\0009\0\4\0D\0\1\0K\0\1\0\1¿\17autopairs_cr\24coc#_select_confirm\15pumvisible\afn\bvim\0¸\1\1\0\b\0\15\0\0236\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\0029\2\5\0015\4\6\0B\2\2\0016\2\a\0004\3\0\0=\3\b\0026\2\b\0003\3\n\0=\3\t\2\18\2\0\0'\4\v\0'\5\f\0'\6\r\0005\a\14\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\fnoremap\2\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\0\23completion_confirm\vMUtils\a_G\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: cutlass.nvim
time([[Config for cutlass.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcut_key\6c\nsetup\fcutlass\frequire\0", "config", "cutlass.nvim")
time([[Config for cutlass.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: telescope-heading.nvim
time([[Config for telescope-heading.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fheading\19load_extension\14telescope\frequire\0", "config", "telescope-heading.nvim")
time([[Config for telescope-heading.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nâ\2\0\0\4\0\n\0\0165\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2'\2\5\0&\1\2\1=\1\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\17auto-session\frequire\26auto_session_root_dir\14/session/\tdata\fstdpath\afn\bvim\1\0\5\22auto_save_enabled\1\25auto_restore_enabled\1\14log_level\tinfo%auto_session_enable_last_session\1\25auto_session_enabled\2\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\18close_command\rBdelete!\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nå\2\0\0\5\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\a\0025\3\14\0005\4\r\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\2\18resize_window\1\17quit_on_open\1\1\0\1\nwidth\3\30\bgit\1\0\2\vignore\2\venable\2\ffilters\1\0\1\rdotfiles\2\tview\1\0\1\21hide_root_folder\1\15auto_close\tture\1\0\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: fold-preview.nvim
time([[Config for fold-preview.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0", "config", "fold-preview.nvim")
time([[Config for fold-preview.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType latex ++once lua require("packer.load")({'spellsitter.nvim'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'tabular', 'coc.nvim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'coc.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vimtex', 'spellsitter.nvim', 'vim-table-mode', 'latexindent.pl', 'jupytext.vim', 'vim-markdown', 'glow.nvim', 'nvim-scrollbar', 'tex-conceal.vim', 'zen-mode.nvim', 'nabla.nvim', 'tabular', 'tagbar', 'coc.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex', 'vim-table-mode', 'latexindent.pl', 'jupytext.vim', 'vim-markdown', 'nvim-scrollbar', 'tex-conceal.vim', 'zen-mode.nvim', 'nabla.nvim', 'tabular', 'tagbar', 'coc.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType ipynb ++once lua require("packer.load")({'vimtex', 'vim-table-mode', 'latexindent.pl', 'jupytext.vim', 'vim-markdown', 'nvim-scrollbar', 'tex-conceal.vim', 'zen-mode.nvim', 'nabla.nvim', 'tabular', 'tagbar', 'coc.nvim'}, { ft = "ipynb" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-scrollbar', 'nvim-dap-python', 'zen-mode.nvim', 'nvim-dap-ui', 'nvim-dap', 'tagbar', 'coc.nvim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'vimtex', 'vim-table-mode', 'latexindent.pl', 'nvim-scrollbar', 'tex-conceal.vim', 'zen-mode.nvim', 'nabla.nvim', 'tabular', 'tagbar', 'coc.nvim'}, { ft = "org" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'substitute.nvim', 'bufdelete.nvim', 'limelight.vim', 'vim-table-mode', 'leetcode.vim', 'vim-startify', 'sidebar.nvim', 'Comment.nvim', 'vim-repeat', 'indent-blankline.nvim', 'vim-monokai', 'vim-illuminate', 'vim-easy-align', 'onedarkpro.nvim', 'vim-devicons', 'nvim-window.git', 'nvim-surround', 'playground', 'nvim-transparent', 'nvim-scrollbar', 'vim-code-dark', 'sniprun', 'nvim-lspconfig', 'gruvbox-material', 'train.nvim', 'neorg', 'nvim-ts-rainbow', 'tokyonight.nvim', 'nvim-hlslens', 'zen-mode.nvim', 'nvim-dap-ui', 'vim', 'nvim-dap', 'ayu-vim', 'tabular', 'vim-visual-multi', 'nord-vim', 'vim-snippets', 'neovim', 'neoformat', 'neomake', 'vim-be-good', 'monokai_transparent', 'coc.nvim', 'edge', 'material.nvim', 'TrueZen.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'substitute.nvim', 'limelight.vim', 'vim-table-mode', 'leetcode.vim', 'vim-startify', 'sidebar.nvim', 'Comment.nvim', 'vim-repeat', 'indent-blankline.nvim', 'vim-monokai', 'vim-illuminate', 'vim-easy-align', 'onedarkpro.nvim', 'vim-devicons', 'nvim-surround', 'playground', 'nvim-transparent', 'nvim-scrollbar', 'vim-code-dark', 'sniprun', 'nvim-lspconfig', 'gruvbox-material', 'train.nvim', 'neorg', 'nvim-ts-rainbow', 'tokyonight.nvim', 'nvim-hlslens', 'zen-mode.nvim', 'nvim-dap-ui', 'vim', 'nvim-dap', 'ayu-vim', 'tabular', 'vim-visual-multi', 'nord-vim', 'vim-snippets', 'neovim', 'neoformat', 'neomake', 'vim-be-good', 'monokai_transparent', 'coc.nvim', 'edge', 'material.nvim', 'TrueZen.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/caoyu/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/caoyu/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
