# KOReader patches for BQ Cervantes

Tested on BQ Cervantes 2013 running KOReader 2025.10 "Ghost".

## How to install patches

Check the [user guide](https://koreader.rocks/user_guide/#L2-userpatches) for detailed instructions.

## List of patches

### [1-cervantes-frontlight-sync-on-startup.lua](1-cervantes-frontlight-sync-on-startup.lua)

Fixes frontlight issue where, on startup, KOReader says it is "on" but the light is actually "off". The issue is caused by KOReader setting the frontlight status as "on" by default, but never turning the actual light on. This patch should fix the issue regardless of the default value being "on" or "off".

### [2-cervantes-wifi-fix.lua](2-cervantes-wifi-fix.lua)

Fixes WiFi checkbox and status icons behavior. These issues were caused by KOReader not detecting the WiFi "off" status. This patch was based on the code shown in [issue #5084](https://github.com/koreader/koreader/issues/5084#issuecomment-528145116).

### [2-cervantes-home-button.lua](2-cervantes-home-button.lua)

Brings back the Home button behavior from the original BQ firmware.

- Short press: Home
- Long press: Toggle frontlight
- Double tap: Suspend