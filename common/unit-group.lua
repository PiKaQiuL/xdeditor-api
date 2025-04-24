---@meta UnitGroup

---@class UnitGroup
local UnitGroup = {}


---获取单位组长度
---@return number 单位组长度
function UnitGroup:get_length() end

---添加单位
---@param unit Unit
function UnitGroup:add_item(unit) end

---遍历单位组
---
---遍历单位组，返回真则结束
---@param callback fun(unit: Unit):boolean|nil
function UnitGroup:forEachEx(callback) end

---复制单位组
---@return UnitGroup 单位组
function UnitGroup:copy() end
