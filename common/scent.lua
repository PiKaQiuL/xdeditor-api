---@meta Scene

---@class Scene: string



---@class SceneObject
local SceneObject = {}

---
---获取当前场景所有单位
---
--- 获取场景下，包含所有单位的单位组
--- 如果目标场景没有被加载，活获取到空的单位组
---
---@return UnitGroup
function SceneObject:get_all_unit() end

---
---创建矩形区域
---
---在场景创建矩形区域
---在场景释放时会销毁
---
---@param core Point 中心点
---@param width number 宽
---@param height number 高
function SceneObject:add_rect(core, width, height) end

---
---创建圆形区域
---
---在场景创建圆形区域
---在场景释放时会销毁
---
---@param core Point 中心点
---@param radius number 半径
---@return RegionCircle
function SceneObject:add_circle(core, radius) end

---
---获取原始场景名
---
---如果场景对象是副本，则获取模板的名字
---
---@return Scene
function SceneObject:get_default_name() end

---
---获取副本名字
---
---如果场景不是副本，则副本名与场景名相同
---
---@return string
function SceneObject:get_key_name() end

---
---获取所有添加的区域
---
---不会获取到默认创建在场景上的区域
---
---@return Region[]
function SceneObject:get_all_area() end

---
---获取所有手动添加的触发器
---
---@return Trigger[]
function SceneObject:get_all_trigger() end

---
---添加触发器
---
---@param trigger Trigger
function SceneObject:add_trigger(trigger) end

---
---释放场景
---
function SceneObject:close() end

---
---场景内的点
---
---@param x number
---@param y number
---@return Point
function SceneObject:scene_point(x, y) end

---
---在场景上创建单位
---
---@param player Player
---@param unit_id UnitID
---@param core Point
---@param angle number
---@param isAI boolean
---@return Unit
function SceneObject:add_unit(player, unit_id, core, angle, isAI) end

---
---玩家跳转
---
---让玩家跳转到场景对象锁指向的场景
---
---@param player Player
---@param carry_hero boolean
function SceneObject:player_jump(player, carry_hero) end

---
---获取矩形区域内的所有单位
---
---@param region RegionRect
---@return UnitGroup
function SceneObject:get_units_from_rect(region) end

---
---获取扇形区域的所有单位
---
---@param start_point Point 起始点
---@param angle number 角度
---@param radius number 半径
---@param central_angel number 圆心角
---@return UnitGroup
function SceneObject:get_units_from_sector(start_point, angle, radius, central_angel) end

---
---获取指定方向矩形区域内的所有单位
---
---@param start_point Point 起始点
---@param long number 长度
---@param width number 宽度
---@param angle number 角度
---@return Unit[]
function SceneObject:get_units_from_directed_rect(start_point, long, width, angle) end
