# Firefox

## Menus

* Right-click > **T**ake Screenshot
* Tools
  * Browser Tools
    * Eyedropper = color picker
  * Settings
    * Privacy & Security > Logins & Passwords >
      * _Saved Logins_ = view/delete saved logins & passwords
      * _Use a Primary Password_ = encrypts FF stored logins & passwords
  * Help > More troubleshooting information > _Refresh Firefox…_ (also when initiating Uninstall) = reset extensions & customizations
* `about:config`
  * `general.smoothScroll`
  * `browser.ctrlTab.sortByRecentlyUsed` = tabs cycling strategy (_1-2-3_ or _1-2 1-2_)

## Shortcuts

* `F6` or `Alt + D` or `Ctrl + L` = Go to address bar
* `F7` = Toggle Caret Browsing (displays text cursor that is usually hidden)
* `F12`== `Ctrl + Shift + I`  = Web Developer Tools

* (`Backspace` = Go back (_note: this was changed in Firefox 86 to prevent loss of input data, but can be manually re-enabled_)
* `Alt + Left/Right` =  = Navigate back/forward
* `Alt + Mouse Scroll` = Navigate back/forward

* `Ctrl + {#}` = open {#}th tab
* `Ctrl + E/K` = search (bar)
* `Ctrl + U` = Page Source
* `Ctrl + Shift + J` = (master) Browser Console (able to log from all sources, eg a standalone popup page)
* `Ctrl + Shift + M` = Responsive Design Mode
* `Ctrl + Shift + X` = toggle left-to-right text
* `Ctrl + (Shift +) Tab` = next/previous tab
* `Ctrl + Page Up/Down` = next/previous tab

* `Shift + Del` = forget Search query (browse queries in Search bar via arrows)
* `Shift + Esc` = Process/Task Manager
* `Shift + Left/Right Mouse wheel` = scroll horizontally
* `(Shift +) Space` = scroll up/down

## Extensions

* [Web Developer's Toolbox](https://addons.mozilla.org/en-US/firefox/collections/4757633/webdeveloper)

* 7TV = Twitch & YouTube features, emotes
* BetterTTV = Twitch & YouTube features, emotes
* Buster: Captcha Solver for Humans = auto captchas solving
* **Cookie AutoDelete** = delete closed tabs cookies
* Cookie Clicker Mod Manager = loads Cookie Clicker mods
* **Dark Reader** = dark mode everywhere
* **Decentraleyes** = blocks trackers
* DelayWebpage = applies a delay on distracting websites
* **Disable JavaScript** = disable JavaScript
* **DuckDuckGo Privacy Essentials** = blocks trackers
* **Facebook Container** = isolates Facebook
* Flash Player 2022 = Flash player
* FoxyProxy = open-source proxy management tool
* **Ghostery - Privacy Ad Blocker** = blocks ad trackers
* **Google Container** = isolates Google
* Honey = finds online shopping coupon codes
* Hoxx VPN Proxy = browser proxy
* HTTPS Everywhere (_discontinued_) = use HTTPS for websites that support it
* **I don't care about cookies** = gets rid of most websites' cookie warnings
* Kee - Password Manager = KeePass
* Keep or Delete Bookmarks = clean up bookmarks
* **LeechBlock NG** = block time-wasting websites (eg `.*reddit\.com/r/pleiade.*`)
* Location Guard = hides/spoofs geolocation
* **NoScript** = protects against XSS & other web exploits
* **OneTab** = reduces memory usage & tab clutter
* **Privacy Badger** = blocks trackers
* Redirector = user-defined rules redirections
  * Facebook
    * Description = _Facebook redirect_
    * Example URL = _facebook.com_
    * Include pattern = `*facebook.com`
    * Redirect to = <https://www.facebook.com/?sk=h_chr>
    * Pattern type = Wildcard
    * Pattern Description = <https://lifehacker.com/how-to-force-a-chronological-feed-in-facebooks-new-desi-1842426847>
  * Reddit
    * Description = _Reddit front page_
    * Example URL = <https://www.reddit.com>
    * Include pattern = `*reddit.com`
    * Redirect to = <https://www.reuters.com>
    * Pattern type = Wildcard
* **Return YouTube Dislike** = displays YouTube dislikes count
* Ruffle - Flash Emulator = Flash player
* SponsorBlock = skip YouTube video sponsors
* The Stream Detector = download streams
* **uBlock Origin** = blocks ads
* Video DownloadHelper = download HTTP videos (& images)
  * [DownloadHelper CoApp](https://github.com/aclap-dev/vdhcoapp) = cross-platform companion application enabling file writing, video player launcher, _ffmpeg_
* Video Scrubber for Instagram = displays Instagram video player controls
* **Video Speed Controller** = HTML5 video speed controls & keyboard shortcuts

## Troubleshooting

* [Drag&Drop URLs to Windows not working](https://support.mozilla.org/en-US/kb/windows-administrator-launcher-process-error-fix)
