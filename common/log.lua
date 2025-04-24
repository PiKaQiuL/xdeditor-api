
---@meta Log

---@class Log
---@field info fun(...)
---@field warn fun(...)
---@field error fun(...)
---@field debug fun(...)
log = {}


---
---
---@generic Any: any
---@param ... Any
function log.info(...) end

---
---
---@generic Any: any
---@param ... Any
function log.warn(...) end


---
---
---@generic Any: any
---@param ... Any
function log.error(...) end


---
---
---@generic Any: any
---@param ... Any
function log.debug(...) end
