---@meta Point

---点
---@class Point
local Point = {}

---
---创建一个点
---
---@param x number
---@param y number
---@param z? number
---@param scene? Scene
---@return Point
function base.point(x, y, z, scene) end

---
---获取两点之间的距离
---
---@param other Point 目标点
---@return number 距离
function Point:distance(other) end

---
---获取两点之间的角度
---
---返回值范围为(-180, 180)
---
---@param other Point 目标点
---@return number 角度
function Point:angle(other) end

---
---播放音效
---
---播放音效。多次播放的音效互不影响。
---当[玩家的英雄]与点的距离超过截断距离时，将听不到音效。
---
---@deprecated
---@param sound_name string 音效名称
function Point:play_sound(sound_name) end

---
---极坐标偏移
---
---@param angle number 角度
---@param distance number 距离
---@return Point 新的点
function Point:polar_to_ex(angle, distance) end

---
---是否具有碰撞
---
--- 判断点是否具有静态碰撞
---
---@return boolean
function Point:is_block() end

---
---是否可见
---
---判断点能否被玩家|单位看到。如果是单位，则会使用控制单位的玩家来计算[视野]。
---
---@param unit_or_player  Player | Unit 玩家或单位
---@return boolean
function Point:is_visible_to(unit_or_player) end

---
---获取点的x坐标
---
---@return number
function Point:get_x() end

---
---获取点的y坐标
---
---@return number
function Point:get_y() end

---
---获取点的z坐标
---
---@return number
function Point:get_z() end

---
---获取点所在的场景名
---
---@return Scene
function Point:get_scene() end

---
---圆形范围内的单位
---
---@param range number 半径
---@param tag string 目标标签
---@param scene_name Scene 场景名
---@param allow_death_unit boolean 允许死亡单位
---@return Unit[] 单位表
function Point:group_range(range, tag, scene_name, allow_death_unit) end

---
---获取场景坐标
---
---@return Point
function Point:get_scene_point() end

---
---设置点高度(z坐标)
---
---@param height number
function Point:set_height(height) end

---
---当前地图点是否有碰撞
---
---此接口的会带有场景信息，兼容之前的“是否具有碰撞
---建议使用此接口
---
---@return boolean
function Point:is_block_ex() end

---
---寻路距离
---
---获取起点到终点的寻路距离，无法通行返回-1。
---
---@param other Point 目标点
---@return number 距离
function Point:path_distance(other) end

---
---获取碰撞标记集合
---
---获取场景点的碰撞标记集合
---
---@return CollisionFlags 标记
function Point:get_collision_flags() end

---@alias CollisionFlagsStatic
---| "Unbuildable"      # 不可建造
---| "Cliff"            # 悬崖
---| "Lower"            # 低于地表的障碍物
---| "Unwalkable"       # 不可行走
---| "Unfloatable"      # 不可漂浮
---| "Unamphibious"     # 不可两栖
---| "UnItemplacable"   # 不可放置物品
---| "Unflyable"        # 不可飞行
---| "UnPeonHarvest"    # 不可采集区域
---| "Higher"           # 高于地表的障碍物

---
---碰撞标记集合
---@class CollisionFlags
local CollisionFlags = {}

---
---判断是否包含某一类型碰撞
---@param flag CollisionFlagsStatic 碰撞标记
---@return boolean
function CollisionFlags:contains(flag) end

---
---遍历碰撞标记集合
---@param callback fun(flag: CollisionFlagsStatic): nil
function CollisionFlags.each_collision(callback) end
