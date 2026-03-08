-- Recover Cervantes Home button actions (matches BQ firmware logic):
--   Short press --> Home
--   Long press ---> Toggle frontlight
--   Double tap ---> Suspend

local UIManager = require("ui/uimanager")
local Event = require("ui/event")

local HOLD_S       = 1.2 / 2  -- BQ used 1.2 seconds, I find 0.6 to be better
local DOUBLE_TAP_S = 0.3

local hold_sched   = nil
local home_sched   = nil
local key_released = false

local orig_sendEvent = UIManager.sendEvent

function UIManager:sendEvent(event)
    local handler = event and event.handler
    if not (event.args and event.args[1] and event.args[1].Home) then
        return orig_sendEvent(self, event)
    end

    if handler == "onKeyPress" then
        if home_sched then
            UIManager:unschedule(home_sched)
            home_sched = nil
            if hold_sched then
                UIManager:unschedule(hold_sched)
                hold_sched = nil
            end
            UIManager.event_handlers.Suspend()
            return
        end

        key_released = false

        hold_sched = function()
            hold_sched = nil
            orig_sendEvent(UIManager, Event:new("ToggleFrontlight"))
        end
        UIManager:scheduleIn(HOLD_S, hold_sched)

        home_sched = function()
            home_sched = nil
            if key_released then
                orig_sendEvent(UIManager, Event:new("Home"))
            end
        end
        UIManager:scheduleIn(DOUBLE_TAP_S, home_sched)

    elseif handler == "onKeyRelease" then
        key_released = true
        if hold_sched then
            UIManager:unschedule(hold_sched)
            hold_sched = nil
        end

    else
        return orig_sendEvent(self, event)
    end
end
