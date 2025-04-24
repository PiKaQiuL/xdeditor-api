---@meta Damage


---
---伤害
---
---@class Damage
local Damage = {}







---
---伤害实例
---
---@class DamageInstance
---
---伤害的来源（单位）
---
---@field source Unit
---
---伤害的目标（单位）
---
---@field target Unit
---
---原始伤害值
--- - 类型为（number）。这个属性应该在创建时传入。
---
---@field damage number
---
---当前伤害
--- - 类型为（number）。该属性会初始化为伤害，之后你可以修改当前伤害，最终会使用当前伤害来扣除生命。
---
---@field current_damage number
---
---伤害类型
---
---@field damage_type DamageType
---
local DamageInstance = {}

---
---原始伤害值
---
---@return number
---@deprecated
function DamageInstance:get_damage() end

---
---原始伤害值
---
---@return number
---@deprecated
function DamageInstance:get_current_damage() end

---
---是否是暴击
---
---伤害实例是否暴击（与暴击率相关）
---
---@return boolean
function DamageInstance:is_crit() end
