# KOReader patches for BQ Cervantes

Tested on BQ Cervantes 2013 running KOReader 2025.10 "Ghost".

## How to install patches

Check the [user guide](https://koreader.rocks/user_guide/#L2-userpatches) for detailed instructions.

## List of patches

### [2-cervantes-wifi-fix.lua](2-cervantes-wifi-fix.lua)

Fixes WiFi checkbox and status icons behavior. These issues were caused by KOReader not detecting the WiFi "off" status. This patch was based on the code shown in [issue #5084](https://github.com/koreader/koreader/issues/5084#issuecomment-528145116).