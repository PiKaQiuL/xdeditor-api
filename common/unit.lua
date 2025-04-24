---@meta Unit



---
---@class Unit
---
---单位数据表
---
---@field cache UnitDataCache
---
---物品表
---
---@field inventorys? Inventory[]
---
---AI
---
---@field ai? unknown
---
---已被移除
---
---@field removed? boolean
---
---单位所有直属表现
---
---@field actors? Actor[]
---
local Unit = {}

---
---攻击
---
---@param target Unit
---@deprecated 弃用
function Unit:attack(target) end

---
---增加数值属性
---
---@param unit_atr UnitAttribute
---@param value number
---@deprecated 弃用
function Unit:add(unit_atr, value) end

---
---获取单位的攻击技能
---
---@return Skill?
---@deprecated 弃用
function Unit:attack_skill() end

---
---获取编号
---
---@return number
function Unit:get_id() end

---
---启用AI
---
---启用所有为单位添加的AI
---
function Unit:enable_ai() end

---
---添加技能
---
---每个类型的技能格子从0开始，最大为99。指定格子时，这个格子上已经有技能的话会添加失败；不指定格子时，会找一个最小的空格。
---
---@param spell_id SpellID
---@param abil_slot_type AbilSlotType?
---@param slot_num number?
function Unit:add_skill(spell_id, abil_slot_type, slot_num) end

---
---瞬移至
---
---@param target_pos Point
---@return boolean
function Unit:blink_ex(target_pos) end

---
---创建物品
---
---@param item_id ItemID
---@param point Point | Unit
---@return Item
---@deprecated 弃用
function Unit.create_item(item_id, point) end

---
---单位是否可以攻击目标。
---
---@param target Unit
---@return boolean
---@deprecated 弃用
function Unit:can_attack(target) end

---
---禁用所有为单位添加的AI。
---
function Unit:disable_ai() end

---
---设置掉落列表
---
---设置单位掉落列表，当单位被杀死后，会掉落列表中的奖励。
---
---@param loot_id LootID
function Unit:set_loot(loot_id) end

---
---增加数值属性的特定值
---
---@param unit_number_atr UnitAttribute 单位数值属性
---@param value number 变化值
---@param unit_number_atr_type UnitPropertySubType 单位数值属性类型
function Unit:add_ex(
    unit_number_atr
    , value
    , unit_number_atr_type
)
end

---
---增加高度
---
---@param height number
---@deprecated 弃用
function Unit:add_height(height) end

---
---增加能量
---
---@param resource_type string
---@param value number
---@deprecated 弃用
function Unit:add_resource(resource_type, value) end

---
---添加状态
---
---所有的单位标记都只有有和没有两种状态。但是每种单位标记都有引用计数，也就是说添加两次无敌的单位，需要删除两次无敌才能让单位不无敌。
---
---@param unit_restr UnitRestriction
function Unit:add_restriction(unit_restr) end

---
---添加可见形状
---
---为单位添加可见形状
---如果是一个非常巨大的单位，可以给这个单位设置一个固定形状的可见范围，只要该范围内任何一点可见，单位就可见
---
---@param sight Sight
function Unit:add_sight(sight) end

---
---获取数值属性的特定值
---
---@param unit_number_atr UnitAttribute
---@param unit_property_sub_type UnitPropertySubType
---@return number
function Unit:get_ex(unit_number_atr, unit_property_sub_type) end

---
---数值属性上限
---
---获取单位的数值属性上限，若没有上限，则返回nil。
---
---@param unit_number_atr UnitAttribute
---@return number?
function Unit:get_attribute_max(unit_number_atr) end

---
---数值属性下限
---
---获取单位的数值属性下限，若没有下限，则返回nil。
---
---@param unit_number_atr UnitAttribute
---@return number
function Unit:get_attribute_min(unit_number_atr) end

---
---获取类别
---
---@return UnitClass
---@deprecated 弃用
function Unit:get_class() end

---
---获取朝向
---
---@return number
function Unit:get_facing() end

---
---获取高度
---
---@return number
function Unit:get_height() end

---
---获取名称（数遍ID）
---
---@return UnitID
function Unit:get_name() end

---
---获取单位所属玩家
---
---@return Player
function Unit:get_owner() end

---
---获取坐标
---
---@return Point
function Unit:get_scene_point() end

---
---获取能量
---
---@param resource_type string
---@return number
---@deprecated 弃用
function Unit:get_resource(resource_type) end

---
---获取标记计数
---
---@param unit_sign UnitBehaviorState
---@return number
function Unit:get_restriction(unit_sign) end

---
---被搜索半径
---
---@return number
function Unit:get_attackable_radius() end

---
---队伍编号
---
---单位的队伍编号，将会影响敌友关系与视野
---
---@return number
function Unit:get_team_id() end

---
---令单位向目标移动，将会自动寻路。
---
---@param target_pos Point
---@return WalkResultCode
function Unit:walk(target_pos) end

---
---是否拥有标记
---
---@param unit_sign UnitBehaviorState
---@return boolean
function Unit:has_restriction(unit_sign) end

---
---判断单位是否存活。
---
---@return boolean
function Unit:is_alive_ex() end

---
---是否是单位的友方
---
---@param target Unit | Player
---@return boolean
function Unit:is_ally(target) end

---
---是否是单位的敌人
---
---@param target Unit | Player
---@return boolean
function Unit:is_enemy(target) end

---
---是否是镜像
---
---判断单位是否是镜像。
---复制单位的流程如下：
---
---触发单位-初始化事件
---复制技能
---复制单位属性
---触发单位-创建事件
---
---@return boolean
function Unit:is_illusion() end

---
---是否在指定距离内
---
---@param target Unit | Point
---@param radius number
---@return boolean
function Unit:is_in_range(target, radius) end

---
---单位目标是否可见
---
---@param target Unit | Player
---@return boolean
function Unit:is_visible(target) end

---
---判断单位是否在移动
---
---@return boolean
function Unit:is_walking() end

---
---增加Z轴速度
---
---@param speed number
function Unit:add_z_speed(speed) end

---
---设置Z轴速度
---
---@param speed number
function Unit:set_z_speed(speed) end

---
---获取Z轴速度
---
---@return number
function Unit:get_z_speed() end

---
---杀死单位
---
---杀死单位。没有凶手时，凶手视为自己。
---
---@param unit? Unit
function Unit:kill(unit) end

---
---学习技能
---
---学习/加点成功会触发“单位-学习技能完成时”事件。
---
---@param skill Skill | SpellID
---@return boolean
function Unit:learn_skill(skill) end

---
---复活
---
---复活单位并触发“单位-复活”事件。
---
---@param point Point
function Unit:reborn(point) end

---
---移除
---
---移除并完全释放该单位，不等同于杀死；移除后无法对该单位进行任何操作。
function Unit:remove() end

---
---移除Buff
---
---会移除所有该名称的状态。
---
---@param buff_id BuffID
function Unit:remove_buff(buff_id) end

---
---移除视野共享
---
---移除单位对队伍的视野共享
---
---@param team number 队伍编号
function Unit:remove_provide_sight(team) end

---
---移除状态
---
---@param unit_sign UnitRestriction
function Unit:remove_restriction(unit_sign) end

---
---替换技能
---
---@param spell_id SpellID
---@param new_spell_id SpellID
function Unit:replace_skill(spell_id, new_spell_id) end

---
---设置数值属性的特定值
---
---@param unit_number_atr UnitAttribute 单位数值属性
---@param value number  值
---@param unit_property_sub_type UnitPropertySubType 单位数值属性类型
function Unit:set_ex(unit_number_atr, value, unit_property_sub_type) end

---
---获取单位属性的最终值
---
---@param unit_art number
---@return number
function Unit:get(unit_art) end

---
---设置属性值
---
---会清除属性的百分比部分。
---
---@param unit_number_atr UnitAttribute | UnitStringAttribute
---@param value number | string
function Unit:set(
    unit_number_atr,
    value
)
end

---
---设置数值属性上限
---
---设置单位数值属性上限，影响单位属性最终值
---
---@param unit_number_atr UnitAttribute
---@param max number
function Unit:set_attribute_max(unit_number_atr, max) end

---
---设置数值属性下限
---
---设置单位数值属性下限，影响单位属性最终值
---
---@param unit_number_atr UnitAttribute
---@param min number
function Unit:set_attribute_min(unit_number_atr, min) end

---
---设置单位属性同步方式
---
---@param unit_atr UnitAttribute | UnitStringAttribute
---@param sync_type SyncType
function Unit:set_attribute_sync(unit_atr, sync_type) end

---
---设置朝向
---
---@param angle number
function Unit:set_facing(angle) end

---
---修改单位模型为指定资源。
---
---@param model_id ModelID
function Unit:set_asset(model_id) end

---
---设置能量
---
---@param resource_type string
---@param value number
---@deprecated 弃用
function Unit:set_resource(resource_type, value) end

---
---设置被搜索半径
---
---@param radius number
function Unit:set_attackable_radius(radius) end

---
---获取单位所在场景
---
---@return Scene
function Unit:get_scene_name() end

---
---跳转场景
---
---@param scene Scene
---@return boolean
function Unit:jump_scene(scene) end

---
---异步设置位置
---
---异步设置单位位置
---注意：该语句执行后，只有服务端的位置会改变，客户端的位置仍保留
---@param point Point
function Unit:set_location_async(point) end

---
---异步设置朝向
---
---异步设置单位朝向
---注意：该语句执行后，只有服务端的朝向会改变，客户端的朝向仍保留
---@param angle number
function Unit:set_facing_async(angle) end

---
---获取单位的经验值
---
---@return number
function Unit:get_exp() end

---
---增加单位经验值
---
---@param value number 经验值
---@param ignore_scale boolean 是否忽略倍率
function Unit:add_exp(value, ignore_scale) end

---
---获取单位的等级
---
---@return number
function Unit:get_level() end

---
---增加单位等级
---
---@param level number
function Unit:add_level(level) end

---
---设置单位等级
---
---@param level number
function Unit:set_level(level) end

---
---获取单位的等级上限
---
---@return number
function Unit:get_max_level() end

---
---设置单位的等级上限
---
---@param level_max number
function Unit:set_max_level(level_max) end

---
---获取单位的经验倍率
---
---@return number
function Unit:get_exp_fraction() end

---
---设置单位的经验倍率
---
---@param fraction number
function Unit:set_exp_fraction(fraction) end

---
---设置单位禁止参与经验值分配
---
---@param flag boolean
function Unit:set_prohibit_exp_distribute(flag) end

---
---设置单位升级配置
---
---@param id UnitLevelProfileID
function Unit:set_level_profile(id) end

---
---计算单位某一级所需的经验
---
---@param level number
---@return number
function Unit:get_single_level_exp(level) end

---
---计算单位升到某一级所需的总经验
---
---@param level number
---@return number
function Unit:get_cumu_level_exp(level) end

---
---施放技能
---
---@param skill Skill | SpellID
---@param target? number | Unit | Point | boolean
function Unit:cast(skill, target) end

---
---施放无目标技能
---
---@param skill Skill | SpellID
function Unit:cast_no_target(skill) end

---
---施放单位目标技能
---
---@param skill Skill | SpellID
---@param target Unit
function Unit:cast_on_unit(skill, target) end

---
---施放地面目标技能
---
---@param skill Skill | SpellID
---@param point Point
function Unit:cast_on_point(skill, point) end

---
---施放向量目标技能
---
---@param skill Skill | SpellID
---@param angle number
function Unit:cast_on_angle(skill, angle) end

---
---清空命令队列
---
---清空单位的命令队列，命令包含攻击、传送、释放技能、移动等。
---
function Unit:clean_command() end

---
---单位正在施放的技能实例
---
---@return Cast
function Unit:current_skill() end

---
---共享单位视野
---
---@param team_id number
function Unit:add_provide_sight(team_id) end

---
---获取当前状态的快照
---
---调用该api时单位的名字、玩家、点、朝向。
---
---@return Snapshot
function Unit:get_snapshot() end

---
---创建物品栏
---
---@param item_container_id ItemContainerID
---@return Inventory
function Unit:create_inventory(item_container_id) end

---
---能否捡取物品
---
---@param item Item
---@return boolean
function Unit:con_hold(item) end

---
---执行效果
---
---执行数遍中的效果节点
---
---@param target Point | Unit 目标
---@param effect_id EffectID 效果名
---@return ValidatorCode 验证器代码
function Unit:execute_on(target, effect_id) end

---
---是否持有指定数遍ID的物品
---
---@param item_id ItemID
---@return boolean
function Unit:has_item(item_id) end

---
---身上所有物品
---
---@return Item[]
function Unit:all_items() end

---
---对单位造成伤害
---
---令单位对单位造成伤害，并创建一个伤害实例。
---
---@param target Unit
---@param damage number
---@param damage_type DamageType
function Unit:do_trigger_damage(target, damage, damage_type) end

---
---身上一个指定Buff的实例
---
---如果有多个同名状态，则返回其中一个状态。
---
---@param buff_id BuffID
---@return Buff?
function Unit:find_buff(buff_id) end

---
---单位是否拥有指定Buff
---
---@param buff_id BuffID
---@return boolean
function Unit:has_buff(buff_id) end

---
---身上一个指定技能
---
---寻找单位身上一个指定的技能
---
---@param spell_id SpellID
---@return Skill?
function Unit:find_skill(spell_id) end

---
---治疗目标单位
---
---令单位治疗目标单位，并创建一个治疗实例。
---
---@param target Unit
---@param value number
function Unit:heal_ex(target, value) end

---
---移除动画
---
---@param anim string 动画名称
function Unit:remove_animation(anim) end

---
---身上所有指定类型的技能
---
---@param abil_slot_type? AbilSlotType
---@deprecated 弃用
function Unit:each_skill(abil_slot_type) end

---
---获取添加在单位身上的所有移动器
---
---@return Mover[]
---@deprecated 弃用
function Unit:each_mover() end

---
---身上所有指定数编Id的Buff
---
---
---@param buff_id? BuffID
---@return Buff[]
---@deprecated 弃用
function Unit:each_buff(buff_id) end

---
---指定数编Id的buff的总层数（计算所有实例）
---
---@param buff_id BuffID
---@return number
function Unit:get_buff_stack_all(buff_id) end

---
---获取单位添加在身上的所有技能
---
---@return Skill[]
---@deprecated 弃用
function Unit:each_skill_all() end

---
---设置模型属性
---
---可设置属性有：缩放、X轴缩放、Y轴缩放、Z轴缩放、朝向、动画速度。
---
---@param model_atr string
---@param value any
function Unit:set_model_attribute(model_atr, value) end

---
---手动执行AI
---
function Unit:execute_ai() end

---
---发送事件
---
---@param event_name string
---@param ... unknown
function Unit:event_notigy(event_name, ...) end

---
---直接给予奖励
---
---直接给予单位奖励，奖励为目标单位的掉落列表。
---
---@param loot_id LootID 奖励Id
---@param target Unit
function Unit:grant_loot(loot_id, target) end

---
---变更单位类型
---
---变更单位类型，成功返回true
---
---@param unit_id UnitID
---@return boolean
function Unit:change_type(unit_id) end

---
---重建单位Buff表现
---
---重建附加在单位身上Buff的表现，摧毁并重新生成。
---
function Unit:refresh_unit_buff_actors() end

---
---获取单位身上指定槽位中的技能。
---
---@param slot number
---@return Skill?
function Unit:find_skill_by_slot(slot) end

---
---设置单位的所属玩家
---
---@param player Player
function Unit:set_owner(player) end

---
---AI默认普攻技能
---
---@return Skill?
function Unit:get_attack() end

---
---拥有组件
---
---@param module UnitDataModule
---@return boolean
function Unit:has_module(module) end

---
---是物品
---
---物品单位也属于一种单位。物品对象拥有在地上时的单位属性，而该单位也有物品对象属性。普通单位没有物品对象属性。
---
---@return boolean
function Unit:is_item() end

---
---设置单位在场景中的比例大小
---
---@param scale number
function Unit:set_scale(scale) end

---
---拥有静态过滤
---
---@param filter UnitLabel
---@return boolean
function Unit:has_label(filter) end

---
---免疫判定
---
---@param flag UnitBehaviorState
---@return boolean
function Unit:has_immunity(flag) end

---
---指定编号物品栏的全部物品
---
---获取单位身上指定编号物品栏中的全部物品。
---注意：该语句的物品栏编号从1开始计算
---
---@param inventory_num number
---@return Item[]
function Unit:get_inventory_items(inventory_num) end

---
---是否是有效单位
---
---@return boolean
function Unit:is_valid() end

---
---设置数值属性的特定值
---
---@param attribute UnitAttribute 单位属性
---@param sub_attribute UnitPropertySubTypeEx 单位属性子类型
---@param value number
function Unit:set_custom(
    attribute,
    sub_attribute,
    value
)
end

---
---增加数值属性的特定值
---
---@param attribute UnitAttribute 单位属性
---@param sub_attribute UnitPropertySubTypeEx 单位属性子类型
---@param value number
function Unit:add_custom(
    attribute,
    sub_attribute,
    value
)
end

---
---获取数值属性的特定值
---
---@param attribute UnitAttribute 单位属性
---@param sub_attribute UnitPropertySubTypeEx 单位属性子类型
---@return number
function Unit:get_custom(attribute,
                         sub_attribute) end

---
---所有指定数编Id的Buff实例
---
---@param buff_id BuffID
---@return Buff[]
function Unit:get_buffs_by_link(buff_id) end

---
---添加Buff
---
---@param link string
---@return fun(atg1: any):Buff
---@deprecated 弃用
function Unit:add_buff(link) end

---
---将物品移动到物品栏内指定序号的格子
---
---格子ID为空时自动查找一个空的格子。
---
---@param item Item
---@param slot_id? number
---@return boolean
function Unit:assign_item_to_slot_by_id(item, slot_id) end

---
---判断单位是否拥有ai。
---
---@return boolean
function Unit:has_ai() end

---
---设置字符串属性的特定值
---
---@param unit_atr UnitStringAttribute
---@param value string
function Unit:set_string(unit_atr, value) end

---
---获取字符串属性的特定值
---
---@param unit_atr UnitStringAttribute
---@return string
function Unit:get_string(unit_atr) end

---
---强制刷新公式属性值
---
---若指定的属性为自定义公式属性，该动作能强制重新计算该属性的公式值结果并同步到客户端。
---
---在数编内设置的单位初始属性默认不会进行公式运算，当需要对初始属性强制进行刷新时可以调用这个API。
---
---@param attribute UnitAttribute
function Unit:refresh(attribute) end

---
---播放动画
---
---具体意义由time_type决定。为[空]或者[负数]则视为默认倍速播放
---时间因子的类型
--- - 0: 默认速度播放
--- - 1: 视为持续时间。将欲播放的动画自动缩放至time所指定的时间长度
--- - 2: 视为缩放倍率。将欲播放的动画以指定倍率速度播放。（与global_time_scale相乘）
--- - 3: 视为绝对缩放倍率。不考虑global_time_scale。
---完整版api，不开放给用户
---
---@param anim_name string 动画名
---@param duration number | nil 时间因子
---@param factor_type number 时间因子类型
---@param start_time number 从动画的第x秒播放
---@param priority number 动画优先级
---@deprecated
function Unit:anim_play(anim_name, duration, factor_type, start_time, priority) end

---
---播放组合动画
---
---完整api，目前不开放给用户
---
---@param born string 出生动画
---@param normal string 持续动画
---@param die string 结束动画
---@deprecated
function Unit:anim_play_bracket(born, normal, die) end

---
---播放动画
---
---播放一次动画，在动画期间会被优先级更高的播放动画覆盖
---
---@param anim_name string 动画名
---@param priority number 动画优先级
function Unit:anim_play_once(anim_name, priority) end

---
---播放动画（指定速度）
---
---播放一次动画，在动画期间会被优先级更高的播放动画覆盖
---速度1为默认速度
---
---@param anim_name string 动画名
---@param speed number 播放速度
---@param priority number 动画优先级
function Unit:anim_play_speed(anim_name, speed, priority) end

---
---播放动画（指定时间）
---
---播放一次动画，在动画期间会被优先级更高的播放动画覆盖
---将播放的动画缩放至time秒
---
---@param anim_name string 动画名
---@param duration number 持续时间
---@param priority number 动画优先级
function Unit:anim_play_time(anim_name, duration, priority) end

---
---播放动画（从动画的指定位置开始）
---
---播放一次动画，在动画期间会被优先级更高的播放动画覆盖
---开始时间为0时，从动画开始0秒播放
---速度1为默认速度
---
---@param anim_name string 动画名
---@param start_time number 开始时间
---@param speed number 播放速度
---@param priority number 动画优先级
function Unit:anim_play_start_time(anim_name, start_time, speed, priority) end

---
---播放组合动画（单次）
---
---会依次播放【出生动画】【持续动画】【结束动画】
---为空时跳过
---
---@param born? string 出生动画
---@param normal? string 持续动画
---@param die? string 结束动画
function Unit:anim_play_bracket_once(born, normal, die) end

---
---播放组合动画
---
---会播放【开始动画】后播放【持续动画】
---【持续动画】持续播放【持续时间】秒
---后续播放一次【结束动画】
---
---@param born string 出生动画
---@param normal string 持续动画
---@param die string 结束动画
---@param duration number 持续时间
function Unit:anim_play_bracket_time(born, normal, die, duration) end

---
---停止播放动画
---
---停止播放所有由触发器播放的动画
---
function Unit:anim_stop() end

---
---单位设置开关状态为
---
---@param spell_id SpellID | Skill
---@param is_enable boolean
function Unit:cast_on_switch(spell_id, is_enable) end

---
---删除物品栏
---
---删除指定背包，如果背包内还有物品会掉落到地上
---
---@param inventory Inventory
function Unit:remove_inventory(inventory) end

---
---请求施法
---
---@param skill SpellID | Skill
---@param target? Unit | Point | number
---@param data? table
function Unit:cast_request(skill, target, data) end

---
---立刻停止技能和移动
---
function Unit:stop() end

---单位接取任务
---
---@param quest_id QuestID
---@return Quest?
function Unit:receive_quest(quest_id) end

---
---任务列表
---
---@return Quest[]
function Unit:get_quests() end

---
---任务目标列表
---
---@return QuestCondition[]
function Unit:get_quest_conditions() end

---
---设置单位属性最大值，设空为无上限
---
---@param attribute UnitAttribute
---@param max? number
function Unit:set_attribute_max_user(attribute, max) end

---
---获取当前移动目标
---
---如果当前正在寻路，返回寻路的真目标点，如果当前未在走路，则返回空值
---
---@return Point?
function Unit:get_walking_target() end

---
---指定数编Id的任务
---
---@param quest_link QuestID
---@return Quest?
function Unit:find_quest(quest_link) end

---
---强制设置可见性
---
---强制使单位对某玩家可见或不可见。也可以设置回默认状态。
---
---@param player Player
---@param is_visible PVisibilitySetting
function Unit:set_visible(player, is_visible) end

---
---寻找单位身上一个指定的技能
---
---@param spell_id SpellID 技能Id
---@param is_include_zero boolean 是否包括0级技能
---@return Skill?
function Unit:find_skill_by_i(spell_id, is_include_zero) end

---
---获取物品栏
---
---从单位获取指定编号的物品栏， 没有则返回空值
---注意：该语句的物品栏编号从1开始计算
---
---@param inventory_num number
---@return Inventory?
function Unit:get_inventory(inventory_num) end

---
---设置缩放
---
---@param x number X轴缩放
---@param y number Y轴缩放
---@param z number Z轴缩放
function Unit:set_scale_xyz(x, y, z) end

---
---与目标交互
---
---让单位与目标单位，使用指定技能交互
---技能为【默认交互】或为空时，会检测交列表中所有技能
---
---@param target Unit
---@param spell_id? SpellID
function Unit:behavior_action(target, spell_id) end

---
---使目标与自己交互
---
---让目标单位，使用指定技能，与自己交互
---技能为【默认交互】或为空时，会检测交列表中所有技能
---
---@param target Unit
---@param spell_id? SpellID
function Unit:behavior_action_by(target, spell_id) end

---
---获取单位当前寻路路点数组
---
---如果当前正在寻路，返回寻路路点数组
---
---@return Point[]
function Unit:get_walk_path_points() end

---
---将单位的AI重置。
---
---@param ai_id AIID | base.default_ai
---@param data table
function Unit:reset_ai_to(ai_id, data) end

---
---获取单位上指定冷却组的冷却
---
---@param cd_group string 冷却组
---@return number
function Unit:get_cooldown(cd_group) end

---
---设置单位上指定冷却组的冷却
---
---@param cd_group string 冷却组
---@param cd number 冷却时间
function Unit:set_cooldown(cd_group, cd) end

---
---获取创建信息效果节点
---
---返回一个特殊的效果节点，该效果节点与普通的效果节点类似，可以获取效果节点的施法者、引发技能、引发物品、引发Buff和父效果节点。
---
---此时，若单位是由其他单位召唤得来，获取效果节点的施法者将可获得当前单位的召唤者，而获取效果节点的引发技能、引发物品和引发Buff将可获得召唤了该单位的技能、物品和
---获取创建效果信息节点的父节点将等同于获取创建了该单位的效果节点（通常是一个创建单位效果节点）。
---
---若指定单位并非是由任何单位召唤出来的，则其创建信息效果节点的施法者会是该单位自己。
---
---@return EffectParam
function Unit:get_creation_param() end

---
---向指定方向进行摇杆移动
---
---使单位向指定方向摇杆移动，方向的角度为y/x的反正切
---
---@param x number
---@param y number
function Unit:move_to_direction_request(x, y) end

---
---停止单位当前的摇杆移动
---
function Unit:stop_move_to_direction_request() end

---
---创建飘浮文字
---
---@param target Unit
---@param point Unit | Point
---@param sync SyncType
---@param text string
---@param riseletter_id  RiseletterID
function Unit:texttag_by_location(target, point, sync, text, riseletter_id) end

---
---创建飘浮文字并定义颜色和字号
---
---@param target Unit
---@param point Unit | Point
---@param sync SyncType
---@param text string
---@param riseletter_id RiseletterID
---@param rgb_size number[]
function Unit:texttag_by_location_color_size(target, point, sync, text, riseletter_id, rgb_size) end

---
---将单位附着到别的单位上
---
---@param unit? Unit
---@param bone_name? string 绑点
function Unit:attach_to(unit, bone_name) end

---
---骑乘到单位上
---
---让单位骑乘到别的单位上，骑乘时会在下半身一直播放骑乘动画
---
---@param target Unit
---@param bone_name string 绑点，挂点
---@param ride_anim string 骑乘动画
function Unit:ride_on(target, bone_name, ride_anim) end

---
---接近
---
---@param target Unit | Point
---@param approach_id number 接近Id
---@param max_distance number 最大距离
---@param min_distance number 最小距离
function Unit:approach(target, approach_id, max_distance, min_distance) end

---
---停止连续施法
---
function Unit:clean_recast() end

---
---是否拥有标记
---
---@param restriction UnitRestriction 单位标记
---@return boolean
function Unit:has_restriction_custom(restriction) end

---
---获取标记计数
---
---@param restriction UnitRestriction
---@return number
function Unit:get_restriction_custom(restriction) end

---
---移动到单位
---
---@param target Unit
---@return WalkResultCode
function Unit:walk_to_unit(target) end

---
---设置血条可见状态
---
---值为真时血条可见，为假时不可见
---
---@param is_visible boolean
function Unit:set_status_bar_visibility(is_visible) end

---
---创建带有引发物品的效果节点
---
---返回一个特殊的带物品效果节点，该效果节点与普通的效果节点类似，可以获取效果节点的施法者、引发技能、引发物品、引发Buff和父效果节点。
---
---此时，若单位是由其他单位召唤得来，获取效果节点的施法者将可获得当前单位的召唤者，而获取效果节点的引发技能、引发物品和引发Buff将可获得召唤了该单位的技能、物品和
---返回的效果节点的父节点将等同于获取创建了该单位的效果节点（通常是一个创建单位效果节点）。
---
---若指定单位并非是由任何单位召唤出来的，则该效果节点的施法者会是该单位自己。
---
---@param item Item
---@param unit? Unit
---@return EffectParam
function Unit:create_item_param(item, unit) end

---
---令单位使用物品（无目标）
---
---@param item Item
---@return cast_error_code 施法错误代码
function Unit:use_item_no_target(item) end

---
---令单位使用物品（地面目标）
---
---@param item Item
---@param point Point
---@return cast_error_code 施法错误代码
function Unit:use_item_on_point(item, point) end

---
---令单位使用物品（单位目标）
---
---@param item Item
---@param unit Unit
---@return cast_error_code 施法错误代码
function Unit:use_item_on_unit(item, unit) end

---
---令单位使用物品（向量目标）
---
---@param item Item
---@param angle number
---@return cast_error_code 施法错误代码
function Unit:use_item_on_angle(item, angle) end

---
---令单位使用物品（开关技能）
---
---@param item Item
---@param is_enable boolean
---@return cast_error_code 施法错误代码
function Unit:use_item_switch(item, is_enable) end

---
---让单位结束骑乘
---
function Unit:ride_off() end

---
---获取骑乘的单位
---
---@return Unit?
function Unit:get_ride_unit() end

---
---上半身转向施法开关
---
---需要再单位数编钟开启【允许转向施法】
---
---@param is_enable boolean
function Unit:rotation_upper_body_cast_eanble(is_enable) end

---
---施加向量作用力
---
---@param angle Vector
---@param size number
---@return Force
function Unit:add_force_vector(angle, size) end

---
---为单位移除指定外力
---
---@param force Force
function Unit:remove_force(force) end

---
---移除所有外力
---
function Unit:remove_all_forces() end


---
---单位升级配置ID
---
---@alias UnitLevelProfileID string


---
---单位ID
---
---@alias UnitID string


---
---单位状态
---
---@alias UnitRestriction
---| "幽灵"         #忽略动态碰撞
---| "空间移动"     #空间移动(3D飞行)
---| "定身"
---| "魔免"
---| "缴械"
---| "无敌"
---| "虚空"         #忽略地形高度
---| "召唤"
---| "隐藏"
---| "模型隐藏"
---| "天空"         #忽略视野遮挡
---| "逻辑隐藏"
---| "飞行"         #飞行(忽略静态碰撞)
---| "免死"
---| "暂停"
---| "显影"
---| "隐身"
---| "暂停更新技能" #暂停技能
---| "暂停更新增益" #暂停Buff
---| "蝗虫"        #无法被搜索
---| "禁魔"        #禁魔(弃用)
---| "禁止转向"
---| "物免"
---| "免时停"      #无法被时停
---| "失控"        #忽略技能指令
---


---@class UnitDataCache


---
---目标
---
---@class Target
local Target = {};

---
---单位目标
---
---尝试通过目标对象获取其单位对象。如果目标本身是个点，则会返回空。
---
---@return Unit?
function Target:get_unit() end

---
---点目标
---
---尝试通过目标对象获取其点对象。如果目标本身是个单位，则会返回其坐标。
---
---@return Point
function Target:get_point() end
