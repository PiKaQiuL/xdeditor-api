---@meta Mover


---@alias MoverID string


---
---运动器
---
---@class Mover : MoverData
local Mover = {}

---
---碰撞地形事件
---
---只有当block设置为true时才可能触发此事件。在事件中返回true可以移除运动
---
---@return boolean 是否移除运动
function Mover:on_block() end

---
---完成事件
---
---当直线运动将distance跑完，或是追踪运动追上target后触发。比on_remove先触发
---
function Mover:on_finish() end

---
---碰撞单位事件
---
---只有设置了hit_type后才可能触发此事件。在事件中返回true可以移除运动
---
---@param unit Unit 碰撞到的单位
---@return boolean 是否移除运动
function Mover:on_hit(unit) end

---
---移除事件
---
---运动被移除时触发此事件
---
function Mover:on_remove() end

---
---批量更新
---
---立即更新运动，直到运动完成
---
function Mover:batch_update() end


---
---移除运动
---
function Mover:remove() end

---
---
---@class MoverData 
---
---运动来源
---
---@field source Unit
---
---关联技能
---
---会被设置为创建时使用的技能对象，不需要再次设置。
---
---@field skill? Skill
---
---目标
---
---如果是追踪运动，那么这个值的类型必须是（unit）。如果是直线运动，那么这是个可选参数，会在angle与distance中用到这个值。
---
---@field target? Point | Unit
---
---运动单位
---
---进行运动的单位。mover与model这2个参数需要设置其一，运动才能创建成功
---
---@field mover? Unit
---
---单位名
---
---创建一个临时单位作为运动单位，当运动结束后该单位会被移除。mover与model这2个参数需要设置其一，运动才能创建成功
---
---@field model? UnitID
---
---起点
---
---如果不填，则使用mover的位置或source的位置作为起点
---
---@field start? Point
---
---方向
---
---运动的初始方向，若不填则为运动单位到target的方向
---
---@field angle? number
---
---距离
---
---直线运动的运动距离
---
---@field distance? number
---
---最大距离
---
---追踪运动的最大距离。默认为运动单位到target距离的2倍
---
---@field max_distance? number
---
---速度
---
---@field speed? number
---
---加速度
---
---@field accel? number
---
---速度下限
---
---一般配合加速度使用，使运动速度不会小于该值。默认为0.0
---
---@field min_speed number
---
---速度上限
---
---一般配合加速度使用，使运动速度不会大于该值
---
---@field max_speed? number
---
---起点高度
---
---默认为0
---
---@field height? number
---
---终点高度(number) 离z=0平面
---
---直线运动的默认值为height，追踪运动的默认值为target的受击高度
---
---@field force_height? number
---
---抛物线高度
---
---抛物线的顶点高度，默认为0
---
---@field parabola_height? number
---
---转身速度
---
---追踪运动每秒改变朝向的速度限制。不填表示无限制
---
---@field turn_speed? number
---
---碰撞类型
---
---设置此值后，运动单位与附近单位碰撞时将触发on_hit事件。敌我判断的参考单位为正在运动的单位。不会碰撞到运动单位自己。可以是以下值：
--- - 敌方 碰撞敌方单位
--- - 友方 碰撞友方单位
--- - 全部 碰撞所有单位
---
---@field hit_type? HitType
---
---碰撞范围
---
---@field hit_area? number
---
---附加轰击范围
---
---默认值为0。设置其它值将会影响轰击目标时的验证半径。最终验证半径由目标单位碰撞半径[CollisionRadius]、投射物碰撞范围[hit_area]及投射物附加轰击范围[add_impact_area]之和决定
---
---@field add_impact_area? number
---
---碰撞同一个单位
---
---默认为false
---
---@field hit_same? boolean
---
---碰撞追踪目标
---
---对于追踪运动，当为true时，运动单位与target的距离小于[hit_area]时运动完成；当为false时，运动单位需要到达target的位置时运动完成。默认为true
---
---@field hit_target? boolean
---
---碰撞地形
---
---当为true时，当运动单位到达静态碰撞时会触发on_block事件。若没有注册此事件，则会移除运动
---
---@field block? boolean
---
---优先级
---
---@field priority? number
---
---被动运动
---
---默认为false
---
---@field passive? boolean
---
---分别是mover不能通过的碰撞类型和mover需要的碰撞类型(通行标记), 这两个字段同时生效所以这两个表不能有交集 标记可以为
---
---@field pathing_bit_prevent? CollisionFlagsStatic[]
---
---@field pathing_bit_requird? CollisionFlagsStatic[]
---
---碰撞地形事件
---
---只有当block设置为true时才可能触发此事件。在事件中返回true可以移除运动
---
---@field on_block? fun(self: Mover):boolean
---
---完成事件
---
---当直线运动将distance跑完，或是追踪运动追上target后触发。比on_remove先触发
---
---@field on_finish? fun(self: Mover)
---
---碰撞单位事件
---
---只有设置了hit_type后才可能触发此事件。在事件中返回true可以移除运动
---
---@field on_hit? fun(self: Mover, unit: Unit): boolean
---
---移除事件
---
---运动被移除时触发此事件
---
---@field on_remove? fun(self: Mover)
---


















---
---
---@alias HitType
---| '敌方'
---| '友方'
---| '全部'




