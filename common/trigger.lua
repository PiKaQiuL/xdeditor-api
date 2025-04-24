---@meta Trigger


---@class Trigger
local Trigger = {}




---@class IEventNotify
---
---
---@field event_notify fun(self: self, event_name: string, ...: any[])



---@class TriggerEvent
---
---obj
---
---@field obj? IEventNotify | any
---
---event_name
---
---@field event_name? string
---
---periodic
---
---@field periodic? boolean
---
---time
---
---@field time? number
---
---

