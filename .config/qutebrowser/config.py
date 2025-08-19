# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

import json
from pathlib import Path

def read_pywal_colors():
    wal_colors_path = Path.home() / ".cache" / "wal" / "colors.json"
    with wal_colors_path.open() as f:
        data = json.load(f)
    return data["special"], data["colors"]

special, colors = read_pywal_colors()

#c.colors.statusbar.normal.bg = "#00000000"
#c.colors.statusbar.command.bg = "#00000000"
c.colors.statusbar.normal.bg = special["background"]
c.colors.statusbar.command.bg = special["background"]
c.colors.statusbar.command.fg = special["foreground"]
c.colors.statusbar.normal.fg = colors["color14"]
c.colors.statusbar.passthrough.fg = colors["color14"]
c.colors.statusbar.url.fg = colors["color13"]
c.colors.statusbar.url.success.https.fg = colors["color13"]
c.colors.statusbar.url.hover.fg = colors["color12"]
# c.statusbar.show = "always"
c.colors.tabs.even.bg = "#00000000" # transparent tabs!!
c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.bar.bg = "#00000000"
# c.colors.tabs.even.bg = colors[background"]
# c.colors.tabs.odd.bg = colors[background"]
c.colors.tabs.even.fg = colors["color0"]
c.colors.tabs.odd.fg = colors["color0"]
c.colors.tabs.selected.even.bg = special["foreground"]
c.colors.tabs.selected.odd.bg = special["foreground"]
c.colors.tabs.selected.even.fg = special["background"]
c.colors.tabs.selected.odd.fg = special["background"]
c.colors.hints.bg = special["background"]
c.colors.hints.fg = special["foreground"]
c.tabs.show = "multiple"

c.colors.completion.item.selected.match.fg = colors["color6"]
c.colors.completion.match.fg = colors["color6"]

c.colors.tabs.indicator.start = colors["color10"]
c.colors.tabs.indicator.stop = colors["color8"]
c.colors.completion.odd.bg = special["background"]
c.colors.completion.even.bg = special["background"]
c.colors.completion.fg = special["foreground"]
c.colors.completion.category.bg = special["background"]
c.colors.completion.category.fg = special["foreground"]
c.colors.completion.item.selected.bg = special["background"]
c.colors.completion.item.selected.fg = special["foreground"]

c.colors.messages.info.bg = special["background"]
c.colors.messages.info.fg = special["foreground"]
c.colors.messages.error.bg = special["background"]
c.colors.messages.error.fg = special["foreground"]
c.colors.downloads.error.bg = special["background"]
c.colors.downloads.error.fg = special["foreground"]

c.colors.downloads.bar.bg = special["background"]
c.colors.downloads.start.bg = colors["color10"]
c.colors.downloads.start.fg = special["foreground"]
c.colors.downloads.stop.bg = colors["color8"]
c.colors.downloads.stop.fg = special["foreground"]

c.colors.tooltip.bg = special["background"]
c.colors.webpage.bg = special["background"]
c.hints.border = special["foreground"]

# c.url.start_pages = ""
# c.url.default_page = ""

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui

c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
#config.bind('=', 'cmd-set-text -s :open')
#config.bind('h', 'history')
#config.bind('cs', 'cmd-set-text -s :config-source')
#config.bind('tH', 'config-cycle tabs.show multiple never')
#config.bind('sH', 'config-cycle statusbar.show always never')
#config.bind('T', 'hint links tab')
#config.bind('pP', 'open -- {primary}')
#config.bind('pp', 'open -- {clipboard}')
#config.bind('pt', 'open -t -- {clipboard}')
#config.bind('qm', 'macro-record')
#config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
#config.bind('tT', 'config-cycle tabs.position top left')
#config.bind('gJ', 'tab-move +')
#config.bind('gK', 'tab-move -')
#config.bind('gm', 'tab-move')

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '7%'

# fonts
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

c.content.blocking.enabled = True
