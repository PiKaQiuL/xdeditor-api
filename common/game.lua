---@meta base.Game

---@class base.Game
local Game = {}
base.game = Game


---
---发送事件
---
---@param event_name string 事件名称
---@param ... unknown 事件参数
function Game:event_notify(event_name, ...) end

---
--- 测底结束游戏局
---
--- 设置胜利的队伍id（没有实际意义，这个api和胜负并没有关系，只是调了之后会结束游戏）。
--- 即彻底结束当前游戏局，释放服务器资源并断开所有客户端。
---
---@param unused number
function Game:set_winner(unused) end

---
---加载场景
---
---加载场景（的高度信息、视野和碰撞）。如果相关数据已经存在，则释放老数据，使用新数据。
---默认场景（初始地图）无法被释放，因此也无需重新加载。
---
---@param scene_name Scene 场景名称
---@return SceneObject 场景对象
function Game.load_scene(scene_name) end

---
---释放场景
---
---释放(关闭/删除)指定场景，当前场景有玩家存在的时候，不能释放；场景被成功释放或者本就不存在的时候，返回true。
---默认场景（初始地图）无法被释放。
---
---@param scene_name Scene 场景名称
---@return boolean 是否成功释放场景
function Game.close_scent(scene_name) end

---
---创建场景副本
---
---注意，这会创建一个已有场景的副本。
---如果你想要创建同一场景的多个副本，允许不同玩家处于同一场景的不同副本中但不互相干扰，可以使用这个函数。
---
---如果你只是想要加载一个已有场景，请使用“加载场景”来加载那个场景而非创建副本。
---
---创建场景的副本需要提供一个与现有场景名称不同的场景名。创建了副本的场景依然需要通过“加载场景”函数来加载。
---使用加载场景函数来加载一个场景的副本时，无法直接在触发器中选择场景名，需要通过转换函数来将副本的名字转换为场景，然后传递给加载场景函数。
---切换场景与释放场景也是同理。
---
---这个函数可以有返回值，返回false代表创建副本失败。（多数是因为已经存在同名的场景）
---
---@param scene_name Scene 模版场景
---@param copy_name string 副本场景名称
---@return boolean 是否成功创建副本
function Game.create_scene_copy(scene_name, copy_name) end

---
---获取游戏属性
---
---@param attribute 游戏属性 | string
---@return string | number
function Game.get(attribute) end

---
---设置游戏属性
---@param attribute 游戏属性 | string
---@param value string | number
function Game.set(attribute, value) end

---
---创建一个新的队伍
---
---新建一个队伍并返回其编号，若返回0则代表新建队伍失败（通常是超过了255个队伍）。
---
---@return number 队伍编号
function Game:create_team() end

---
---获得所有玩家队伍的编号数组。
---
---@return number[] 队伍编号列表
function Game:get_all_team_id() end

---
---获取场景对象
---
---获取默认场景对象，除初始场景外其他场景需要加载后才能获得场景对象
---如果场景没有被加载过，获取到的会是空值
---如果先要获场景副本对象，可以使用【通过名称获取场景】
---
---@param scene_name Scene 场景名称
---@return SceneObject| nil 场景对象
function Game.get_scene_object(scene_name) end

---
---获取所有场景对象
---
---@return SceneObject[] 场景对象列表
function Game.get_scene_object_list() end

---
---通过名称获得场景
---
---可以通过创建副本时的名称获得对应的副本场景
---如果没有加载过场景，会返回空
---@param scene_name string
---@return SceneObject| nil 场景对象
function Game.get_scene_object_by_key(scene_name) end

---
---创建并加载场景副本
---
---注意，这会创建一个场景的副本
---无法创建两个相同名称的场景副本
---如果已经创建过对应名称的副本，则会返回已经创建的场景
---@param scene_name Scene 模板场景
---@param copy_name string 副本场景名称
---@return SceneObject | nil 场景对象
function Game.load_create_scene_copy(scene_name, copy_name) end

---
---暂停所有单位
---
---会暂停游戏中所有单位，单位无法移动、施法。技能冷却和身上的Buff也会暂停。但是拥有“免疫时停”装填的单位能够继续行动。
---
---可以选择是否同时暂停游戏时间，如果选择不暂停游戏时间，则游戏时间依然会继续推进，服务器和客户端依然能互通消息。
---
---@param time number 暂停时长，单位为秒
---@param is_not_pause boolean 是否不暂停游戏时间
function Game.time_stop(time, is_not_pause) end

---
---取消暂停所有单位
---
function Game.cancel_time_stop() end

---
---获取默认场景名字
---@return Scene 场景名称
function Game.get_default_scene_name() end

---
---控制游戏速度
---
---用来设置游戏速度
---上限为3倍速度
---下限为1/100倍游戏速度
---@param speed? number
function Game.control_game_speed(speed) end

---
---设置场景拼接
---
---没有拼接场景可设置为空
---@param scene_name Scene
---@param up  Scene | nil
---@param left Scene | nil
---@param down Scene | nil
---@param right Scene | nil
function Game.set_surrounding_scene(scene_name, up, left, down, right) end

---
---获取地块高度
---
---@param scene_name Scene
---@param x number
---@param y number
---@return number
function Game.get_landscape_zaxis(scene_name, x, y) end

---@alias 游戏属性
---| 'GameMode'  #游戏模式
