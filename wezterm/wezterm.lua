local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'Tokyo Night'

--背景透過
config.window_background_opacity = 0.8

-- 背景をぼかす
config.macos_window_background_blur = 20

--フォント設定
config.font = wezterm.font("Ricty Diminished", {weight="Regular", stretch="Normal", style="Normal"})

-- フォントサイズの設定
config.font_size = 16

-- 日本語入力でIMEを使用できるようにする
config.use_ime = true

-- ショートカットキー設定
local act = wezterm.action

config.window_decorations = "RESIZE"

-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.colors = {
   tab_bar = {
     inactive_tab_edge = "none",
   },
 }

config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- return2回でタブ移動
  {
	  key = 'b',
	  mods = 'SHIFT|CTRL',
	  action = wezterm.action{ActivatePaneDirection="Down"}
  }
}

return config
