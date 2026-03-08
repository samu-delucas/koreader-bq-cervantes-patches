-- Fix frontlight on startup. KOReader sets the light to "on" by default,
-- but it doesn't actually turn the light on. This patch fixes it.

local CervantesPowerD = require("device/cervantes/powerd")
local orig_syncLightOnStart = CervantesPowerD._syncLightOnStart
function CervantesPowerD:_syncLightOnStart()
    orig_syncLightOnStart(self)
    if self.fl then
        if self.initial_is_fl_on then
            self.fl:setBrightness(self.hw_intensity)
        else
            self.fl:setBrightness(0)
        end
    end
end
