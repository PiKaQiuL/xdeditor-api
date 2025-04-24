---@meta Timer


---
---计时器
---
---@class Timer
local Timer = {}

---
---暂停计时器
---
function Timer:pause() end

---
---移除计时器
---
function Timer:remove() end

---
---恢复计时器
---
---将计时器从暂停中恢复，它会恢复之前的剩余时间与执行次数继续执行。
---
function Timer:resume() end

---
---重启计时器
---
---将计时器的剩余时间重置回周期时间，但不影响执行次数。
---
function Timer:restart() end

---
---获取流逝时间
---
function Timer:get_current_time() end

---
---设置流逝时间
---
---@param time number
function Timer:set_current_time(time) end

---
---设置剩余时间
---
---@param time number
function Timer:set_remaining_time(time) end


