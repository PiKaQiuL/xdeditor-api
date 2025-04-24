---@meta base


---@class base
base = {

    ---@type base.Game
    game = nil,

}


---
---指定玩家号的玩家
---
---@param number number
---@return Player
function base.player(number) end

---
---触发器最后创建的单位
---
---@return Unit
function base.get_last_created_unit() end

---
---通过坐标创建点
---
---通过坐标(x,y,z)的值在场景中创建点，z的值可为空
---
---@param x number
---@param y number
---@param z? number
---@param scene Scene
---@return Point
function base.scene_point(x, y, z, scene) end

---
---创建单位
---
---在指定地点创建一个单位，并指定其所属玩家、初始朝向以及是否添加默认AI
---
---@param player Player
---@param unit_id UnitID
---@param point Point
---@param face number
---@param is_ai boolean
---@return Unit?
function base.player_create_unit_ai(player, unit_id, point, face, is_ai) end

---
---创建镜像单位
---
---复制单位的流程如下：
--- - 触发单位-初始化事件
--- - 复制技能
--- - 复制单位属性
--- - 触发单位-创建事件
---
---@param unit Unit
---@param point Point
---@param face number
---@return Unit?
function base.create_unit_illusion(unit, point, face) end

---
---创建镜像单位（指定所属玩家）
---
---复制单位的流程如下：
--- - 触发单位-初始化事件
--- - 复制技能
--- - 复制单位属性
--- - 触发单位-创建事件
---
---@param owner_player Player
---@param unit Unit
---@param point Point
---@param face number
---@return Unit?
function base.player_create_unit_illusion(owner_player, unit, point, face) end

---
---创建镜像单位（指定所属单位）
---
---复制单位的流程如下：
--- - 触发单位-初始化事件
--- - 复制技能
--- - 复制单位属性
--- - 触发单位-创建事件
---
---@param owner_unit Unit
---@param unit Unit
---@param point Point
---@param face number
---@return Unit?
function base.unit_create_unit_illusion(owner_unit, unit, point, face) end

---
---添加单位AI
---
---为单位添加指定AI，可以在数据编辑器里自定义AI的逻辑
---
---@param unit Unit
---@param ai_id AIID
---@param data table
function base.unit_add_ai(unit, ai_id, data) end

---
---发送自定义事件
---
---发送自定义事件，可以是内置的事件也可以是新定义的事件，发送这个事件后，所有监听这个事件触发器都会被调用
---
---@param event_name string
---@param event_data any
---@deprecated
function base.custom_event_notify(event_name, event_data) end

---
---使用单位过滤器验证单位
---
---基准单位用于判断以下过滤条件：
---
---自身、同一玩家、盟友、敌方、中立、可见、镜像。
---
---（目标单位与基准单位的关系）
---
---@param filter base.target_filters
---@param unit Unit
---@param base_unit Unit
---@return boolean
function base.target_filter_validate_on_unit(filter, unit, base_unit) end

---
---使用单位过滤器验证单位
---
---使用单位过滤器过滤单位，若满足条件则返回true。
---
---@param filter base.target_filters
---@param unit Unit
---@return boolean
function base.target_filter_validate(filter, unit) end

---
---使用单位过滤器过滤单位组
---
---基准单位用于判断以下过滤条件：
--- - 自身、同一玩家、盟友、敌方、中立、可见、镜像。
---
---目标单位与基准单位的关系）
---
---@param unit_group UnitGroup
---@param filter base.target_filters
---@param base_unit Unit
---@return UnitGroup
function base.unit_group_filter_group_on_unit(unit_group, filter, base_unit) end

---
---使用单位过滤器过滤单位组
---
---使用单位过滤器过滤单位组，原单位组仍然存在，会新建并返回一个符合过滤条件的单位组子集。
---
---@param unit_group UnitGroup
---@param filter base.target_filters
---@return UnitGroup
function base.unit_group_filter_group(unit_group, filter) end

---
---效果节点的原始施法点
---
---@param eff EffectParam
---@return Point
function base.eff_param_origin_point(eff) end

---
---触发器最后创建的技能
---
---触发器最后创建的技能，与触发事件的.技能不是同一个技能
---
---@return Skill
function base.get_last_created_skill() end

---
---为单位添加技能（不指定技能槽位）
---
---@param unit Unit
---@param spell_id SpellID
---@return Skill?
function base.add_skill_simple(unit, spell_id) end

---
---为单位添加技能（并指定位置）
---
---为单位添加技能（并指定技能槽位），如果指定槽位之前已经有技能，并不会发生替换，也不会增加新的槽位来增加技能
---
---@param unit Unit
---@param spell_id SpellID
---@param slot number
---@return Skill?
function base.add_skill_to_slot(unit, spell_id, slot) end

---
---触发器最后创建的Buff
---
---触发器最后创建的Buff，与触发事件的.Buff不是同一个Buff
---
---@return Buff
function base.get_last_created_buff() end

---
---为单位添加Buff
---
---@param unit Unit
---@param buff_id BuffID
---@param level number
---@return Buff?
function base.unit_add_buff(unit, buff_id, level) end

---
---效果节点的引发响应的技能
---
---@param eff EffectParam
---@return Skill?
function base.eff_param_responsing_skill(eff) end

---
---效果节点的引发响应的伤害实例
---
---@param eff EffectParam
---@return DamageInstance?
function base.eff_param_responsing_damage(eff) end

---
---效果节点的施法者
---
---@param eff EffectParam
---@return Unit?
function base.eff_param_caster(eff) end

---
---效果节点的效果树主目标(点)
---
---@param eff EffectParam
---@return Point?
function base.eff_param_main_target_point(eff) end

---
---效果节点的效果树主目标(单位)
---
---@param eff EffectParam
---@return Unit?
function base.eff_param_main_target_unit(eff) end

---
---效果节点的目标点
---
---@param eff EffectParam
---@return Point
function base.eff_param_target_point(eff) end

---
---效果节点的目标单位
---
---@param eff EffectParam
---@return Unit?
function base.eff_param_target_unit(eff) end

---
---效果节点是否拥有目标单位
---
---@param eff EffectParam
---@return boolean
function base.eff_param_has_target(eff) end

---
---效果节点指定类型的祖先节点
---
---@param eff EffectParam
---@param effect_id EffectID
---@return EffectParam?
function base.eff_param_get_by_name(eff, effect_id) end

---
---获取效果节点的效果树自定义值
---
---@param eff EffectParam
---@param custom_value string
---@return number
function base.eff_param_get_userdata(eff, custom_value) end

---
---单位过滤
---
---根据设置过滤器的相应条件过滤单位，返回验证器代码
---
---@param eff EffectParam
---@param target Target
---@param filter base.target_filters
---@return ValidatorCode
function base.validator_unit_filter_new(eff, target, filter) end

---
---布尔值转换为验证器代码值
---
---@param is_meet boolean
---@return ValidatorCode
function base.validator_condition(is_meet) end

---
---验证器“与”操作
---
---两个验证器代码都通过才能返回通过否则返回不通过
---
---@param validator_code1 ValidatorCode
---@param validator_code2 ValidatorCode
---@return ValidatorCode
function base.validator_and(validator_code1, validator_code2) end

---
---验证器“或”操作
---
---两个验证器代码有一个通过就返回通过否则返回不通过
---
---@param validator_code1 ValidatorCode
---@param validator_code2 ValidatorCode
---@return ValidatorCode
function base.validator_or(validator_code1, validator_code2) end

---
---验证器“非”操作
---
---取反验证器代码
---
---@param validator_code ValidatorCode
---@return ValidatorCode
function base.validator_not(validator_code) end

---
---效果节点的目标单位是否拥有Buff
---
---@param eff EffectParam
---@param target Target
---@param buff_name string
---@return number?
function base.validator_unit_has_buff(eff, target, buff_name) end

---
---挂载的弹道的射程
---
---@param eff EffectParam
---@return number?
function base.eff_param_missle_range(eff) end

---
---创建物品
---
---创建物品，在指定位置（点）创建指定物品
---
---@param item_id ItemID
---@param point Point
---@return Item?
function base.create_item_on_point(item_id, point) end

---
---为单位创建物品
---
---为单位创建物品，创建的物品会直接放入单位的背包中
---
---@param item_id ItemID
---@param unit Unit
---@return Item?
function base.create_item_on_unit(item_id, unit) end

---
---触发器最后创建的物品
---
---触发器最后创建的物品，与触发事件的.物品不是同一个物品
---
---@return Item
function base.get_last_created_item() end

---
---物品单位对应的物品对象
---
---物品单位对应的物品对象，物品对象指的是这个物品，物品单位指的是这个物品在地图里对应的单位
---
---@param unit Unit
---@return Item
function base.item_unit_get_item(unit) end

---
---移动物品
---
---移动物品，将指定物品移动到指定的位置（点）
---
---@param item Item
---@param point Point
---@return boolean
function base.item_blink(item, point) end

---
---物品被赋予的标签
---
---@param item Item
---@return string
function base.item_grant_tag(item) end

---
---物品的持有者玩家
---
---@param item Item
---@return Player
function base.item_get_owner(item) end

---
---返回这个场景的整个区域
---
---@param scene Scene
---@return Region
function base.get_scene_scale_area(scene) end

---
---判断点是否在区域内
---
---返回一个布尔值，表示点是否在区域内
---
---@param point Point
---@param region Region
---@return boolean
function base.is_point_in_area(point, region) end

---
---判断单位是否在区域内
---
---返回一个布尔值，表示单位是否在区域内
---
---@param unit Unit
---@param region Region
---@return boolean
function base.is_unit_in_area(unit, region) end

---
---区域内属于某个玩家的指定id且符合过滤条件的单位组成的单位组
---
---@param region Region
---@param player Player
---@param unit_id UnitID
---@param filter base.target_filters
---@return UnitGroup
function base.get_area_player_type_unit_group(region, player, unit_id, filter) end

---
---触发器最后创建的移动器
---
---@return Mover
function base.get_last_created_mover() end

---
---使单位向目标点进行直线运动
---
---@param unit Unit 单位
---@param target_pos Point 目标点
---@param speed number 速度
---@param mover_id MoverID 移动器
---@param on_block? fun(self: Mover): boolean 碰撞地形时
---@param on_finish? fun(self: Mover) 完成移动时
---@param in_hit? fun(self: Mover, unit: Unit): boolean 碰撞单位时
---@param on_remove? fun(self: Mover) 移除时
---@return Mover
function base.skill_mover_line(unit, target_pos, speed, mover_id, on_block, on_finish, in_hit, on_remove) end

---
---使单位向目标单位进行追踪(跟随)运动
---
---@param unit Unit 单位
---@param target_unit Unit 目标单位
---@param speed number 速度
---@param mover_id MoverID 移动器
---@param on_block? fun(self: Mover): boolean 碰撞地形时
---@param on_finish? fun(self: Mover) 完成移动时
---@param on_hit? fun(self: Mover, arg1: Unit): boolean 碰撞单位时
---@param on_remove? fun(self: Mover) 移除时
---@return Mover
function base.skill_mover_target(unit, target_unit, speed, mover_id, on_block, on_finish, on_hit, on_remove) end

---
---矩形区域内的所有单位
---
---@param region_rect RegionRect
---@return Unit[]
---@deprecated
function base.get_rect_area_unit(region_rect) end

---
---圆形区域内的所有单位
---
---@param region_circle RegionCircle
---@return Unit[]
---@deprecated
function base.get_circle_area_unit(region_circle) end

---
---使单位播放指定动画/动作
---
---@param unit Unit 单位
---@param anim_name string 动画名称
---@param play_speed number 播放速度
---@param is_loop boolean 是否循环
---@param anim_part AnimationBodyPart 动画部位
function base.unit_play_animation(unit, anim_name, play_speed, is_loop, anim_part) end

---
---所有单位的数编Id
---
---@return UnitID[]
function base.get_all_units_id() end

---
---所有技能的数编Id
---
---@return SpellID[]
function base.get_all_skills_id() end

---
---所有Buff的数编Id
---
---@return BuffID[]
function base.get_all_buffs_id() end

---
---在指定点创建表现
---
---@param actor_id ActorID 表现Id
---@param point Point 位置
---@param is_height boolean 相对地形高度
---@return Actor
function base.create_actor_at(actor_id, point, is_height) end

---
---将表现附着到单位绑点
---
---@param actor Actor 表现
---@param unit Unit 单位
---@param socket string 绑点
function base.actor_attach_to_unit(actor, unit, socket) end

---
---为Buff创建表现
---
---@param actor_id ActorID
---@param buff Buff
---@return Actor
function base.create_actor_on_buff(actor_id, buff) end

---
---将表现附着到表现上
---
---@param actor Actor 表现
---@param base_actor Actor 宿主
---@param socket string 绑点
function base.actor_attach_to_actor(actor, base_actor, socket) end

---
---设置网格表现的网格大小
---
---@param grid_actor Actor 网格表现
---@param x number X轴大小
---@param y number Y轴大小
function base.actor_set_grid_size(grid_actor, x, y) end

---
---设置网格表现的原点偏移和网格范围
---
---@param grid_actor Actor
---@param x_offset number
---@param y_offset number
---@param x_range number
---@param y_range number
function base.actor_set_grid_range(grid_actor, x_offset, y_offset, x_range, y_range) end

---
---设置网格表现中子网格的状态（仅限网格表现）
---
---@param grid_actor Actor
---@param subgrid_x number
---@param subgrid_y number
---@param state ActorGridState
function base.actor_set_grid_state(grid_actor, subgrid_x, subgrid_y, state) end

---
---在对象上保存任意值
---
---在对象上保存任意值，可以通过“对象上保存的任意值”来取出保存的值
---
---@param obj Object
---@param key string | number
---@param value any
function base.object_store_value(obj, key, value) end

---
---对象上保存的任意值
---
---获取对象上保存的任意值，需要先使用“在对象上保存任意值”函数来保存值，然后就可以使用对应的索引来取出保存值
---
---@param obj Object
---@param key string | number
---@return any
function base.object_restore_value(obj, key) end

---
---暂停游戏
---
function base.pause_game() end

---
---取消暂停游戏
---
function base.unpause_game() end

---
---暂停游戏一段时间
---
---@param time number
function base.pause_game_time(time) end

---
---创建圆形
---
---@param center Point
---@param radius number
---@param scene? Scene
---@return RegionCircle
function base.circle(center, radius, scene) end

---
---创建矩形（通过中心、宽高）
---
---@param center Point
---@param width number
---@param height number
---@param scene? Scene
---@return RegionRect
function base.rect(center, width, height, scene) end

---
---效果节点的引发响应的效果节点
---
---返回引发这个效果节点A的效果节点B，例如受到伤害时，造成伤害的效果节点B就是受到伤害这个效果节点A的引发响应效果节点
---
---@param eff EffectParam
---@return EffectParam?
function base.eff_param_responsing_param(eff) end

---
---新建触发器
---
---@param func fun(...)
---@param events TriggerEvent[]
---@param disabled boolean
---@param scenes? Scene | Scene[]
---@param sync? boolean
---@return Trigger
function base.trigger_new(func, events, disabled, scenes, sync) end

---
---创建线
---
---@param point_list Point[]
---@return Line
function base.line(point_list) end

---
---等待
---
---@param time number
function base.timer_sleep(time) end

---
---触发器最后创建的表现
---
---触发器最后创建的表现，与触发事件的.表现不是同一个表现
---
---@return Actor
function base.get_last_created_actor() end

---
---转换类型
---
---@generic T
---@param type `T`
---@param arg1 any
---@return T
function base.force_as(type, arg1) end

---
---圆形视野
---
---@param point Point
---@param radius number
---@return Sight
function base:sight_range(point, radius) end

---
---发送自定义事件
---
---发送自定义事件，可以是内置的事件也可以是新定义的事件，发送这个事件后，所有监听这个事件触发器都会被调用
---
---@param event TriggerEvent
function base.send_custom_event(event) end

---
---获取指定玩家类型所有玩家
---
---@param type PlayerSlotType
---@return Player[]
function base.get_each_player(type) end

---
---对对象进行类型判定
---
---@generic T
---@param type `T`
---@param obj any
---@return boolean
function base.instance_of(type, obj) end

---
---通过编号获取单位
---
---@param num number
---@return Unit
function base.unit(num) end

---
---获取单位的所有技能
---
---@param unit Unit
---@return Skill[]
function base.unit_all_skill(unit) end

---
---退出游戏
---
---@param player Player
---@param show_box boolean 显示确认框 
function base.game_exit(player, show_box) end

---
---玩家跳转场景
---
---@param player Player
---@param scene Scene
---@param is_hero boolean 是否携带英雄
function base.player_jump_scene(player, scene, is_hero) end

---
---获取区域（矩形或圆形）内的所有单位。
---
---@param region Region
---@return Unit[]
function base.get_area_unit(region) end

---
---单位身上所有Buff
---
---@param unit Unit
---@return Buff[]
function base.unit_all_buffs(unit) end

---
---播放广告回调
---
---@param player Player
---@param callback? fun(arg1: base.ad_result)
function base.adplay_recall(player, callback) end

---
---将数据信息转化为物品实例
---
---@param arg1 table<string, any>
---@param arg2 Unit
---@return Item
function base.load_item_from_info(arg1, arg2) end

---
---获取游戏模式，对应创作者中心设置的游戏模式
---
---@return string
function base.get_gamemode_key() end

---
---查询通用型云变量
---
---@param param ScoreGetParam 查询条件
---@param cb_success fun(arg1: ScoreData[]) 查询成功时
---@param cb_fail fun(arg1: number, arg2: string) 查询失败时
function base.score_get_v2(param, cb_success, cb_fail) end

---
---查询货币型云变量
---
---@param param ScoreGetParam 查询条件
---@param cb_success fun(arg1: ScoreMoneyData[]) 查询成功时
---@param cb_fail fun(arg1: number, arg2: string) 查询失败时
function base.score_money_get_v2(param, cb_success, cb_fail) end

---
---查询列表型云变量
---
---@param param ScoreGetParam
---@param cb_success fun(arg1: ScoreListData[]) 查询成功时
---@param cb_fail fun(arg1: number, arg2: string) 查询失败时
function base.score_list_query_v2(param, cb_success, cb_fail) end

---
---发送消息型云变量
---
---@param param ScoreMsgSendParam
---@param cb_fail fun(arg1: number, arg2: string) 发送失败时
---@deprecated
function base.score_msg_send_v2(param, cb_fail) end


---
---查询消息型云变量
---
---@param param ScoreMsgQueryParam 云变量消息发送参数
---@param cb_success fun(arg1: ScoreMsgData[]) 查询成功时
---@param cb_fail fun(arg1: number, arg2: string) 查询失败时
---@deprecated
function base.score_msg_query_v2(param, cb_success, cb_fail) end

---
---设置消息型云变量已读状态
---
---@param score_id ScoreID
---@param read ReadStatus 消息已读状态
---@param cb_fail fun(arg1: number, arg2: string) 设置失败
---@deprecated
function base.score_msg_modify_read_v2(score_id, read, cb_fail) end


---
---在限定次数内每隔一段时间循环执行动作
---
---每隔一段时间循环执行动作(限定次数)，首次执行将等待一个时间周期后，单位为秒。
---到达限定次数后自动删除计时器触发。
---
---@param time number
---@param count number
---@param callback fun(self: Timer)
---@return Timer
function base.timer_timer(time, count, callback) end

---
---每隔一段时间循环执行动作
---
---每隔一段时间循环执行动作，首次执行将等待一个时间周期后，单位为秒。
---不限定次数。
---
---@param time number
---@param callback fun(self: Timer)
---@return Timer
function base.timer_loop(time, callback) end

---
---等待一段时间后执行动作
---
---执行一次后即删除计时器触发。
---效果等同于次数为1的计时器(timer)
---
---@param time number
---@param callback fun(self: Timer)
---@return Timer
function base.timer_wait(time, callback) end

---
---等待
---
---@param time number 秒
function base.timer_sleep(time) end

---
---@alias TargetFilterEnum string
---| "Allowed"  #允许的
---| "Excluded" #不包括
---| "Required" #需要的


---
---
---@class TargetFilter : DataCache
---@field 自身 TargetFilterEnum
---@field 同一玩家 TargetFilterEnum
---@field 盟友 TargetFilterEnum
---@field 中立 TargetFilterEnum
---@field 敌方 TargetFilterEnum
---@field 可见 TargetFilterEnum
---@field 死亡 TargetFilterEnum
---@field 镜像 TargetFilterEnum
---@field 兵营 TargetFilterEnum
---@field 弹道 TargetFilterEnum
---@field 单位 TargetFilterEnum
---@field 地面 TargetFilterEnum
---@field 箭塔 TargetFilterEnum
---@field 建筑 TargetFilterEnum
---@field 基地 TargetFilterEnum
---@field 近战 TargetFilterEnum
---@field 机械 TargetFilterEnum
---@field 空中 TargetFilterEnum
---@field 泉水 TargetFilterEnum
---@field 商店 TargetFilterEnum
---@field 守卫 TargetFilterEnum
---@field 物品 TargetFilterEnum
---@field 小兵 TargetFilterEnum
---@field 野怪 TargetFilterEnum
---@field 英雄 TargetFilterEnum
---@field 远程 TargetFilterEnum
---@field 作物 TargetFilterEnum
---@field 定身 TargetFilterEnum
---@field 飞行 TargetFilterEnum
---@field 虚空 TargetFilterEnum
---@field 幽灵 TargetFilterEnum
---@field 失控 TargetFilterEnum
---@field 天空 TargetFilterEnum
---@field 缴械 TargetFilterEnum
---@field 禁魔 TargetFilterEnum
---@field 禁止转向 TargetFilterEnum
---@field 空间移动 TargetFilterEnum
---@field 逻辑隐藏 TargetFilterEnum
---@field 免死 TargetFilterEnum
---@field 魔免 TargetFilterEnum
---@field 模型隐藏 TargetFilterEnum
---@field 无敌 TargetFilterEnum
---@field 免时停 TargetFilterEnum
---@field 蝗虫 TargetFilterEnum
---@field 物免 TargetFilterEnum
---@field 显影 TargetFilterEnum
---@field 隐藏 TargetFilterEnum
---@field 暂停 TargetFilterEnum
---@field 暂停更新增益 TargetFilterEnum
---@field 暂停更新技能 TargetFilterEnum
---@field 召唤 TargetFilterEnum
---


---
---单位过滤器
---
---@class base.target_filters
local target_filters = {}

---
---新建一个单位过滤器
---
---@param filter_string string
---@return base.target_filters
function target_filters.new(filter_string) end

---
---通过字符串构建单位过滤器
---
---@param filter_string string
---@return base.target_filters
function target_filters.from_string(filter_string) end

---
---通过数编单位过滤字段构建单位过滤器
---
---@param filter_string TargetFilter
---@return base.target_filters
function target_filters.from_data_field(filter_string) end

---
---用户id
---
---@class UserID
local UserID = {}

---
---通过数字构造用户Id
---
---直接将数字转换为用户Id
---
---@param num number
---@return UserID
function UserID.from_number(num) end


---
---路线
---
---@class Line
---
---通过索引获取线上的点
---
---@field get fun(self: self, index: number): Point
---
---整个路线上所有拐点的数量
---
---@field get_length fun(self: self): number
---


