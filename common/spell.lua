---@meta Spell


---@alias SpellID string



---
---@class Skill
---
---所属单位
---
---@field owner Unit
---
---数据表
---
---@field cache SpellDataCache
---
---技能的上次施法目标
---
---@field last_target nil | Unit | Point | number
---
---目标类型
---
---@field target_type SpellTargetType
---
---关联物品
---
---@field source_item Item
---
---下个连击段数
---
---@field phase number
---
---响应节点
---
---@field responses Response[]
---
---
---
local Skill = {}

--#region 事件

---
---获得事件
---
---每当单位从“没有该技能”变为“拥有该技能”时触发。注意，这里的“没有该技能”有2种情况：
---
--- 1.单位身上没有这个技能
---
--- 2.单位身上有这个技能，但等级为0
--- 
function Skill:on_add() end

---
---失去事件
---
---每当单位失去此技能时触发。
---
function Skill:on_remove() end

---
---升级事件
---
---每当此技能提升等级时触发
---
function Skill:on_upgrade() end

---
---冷却完成事件
---
---每当技能冷却完成时触发此事件。对于充能技能来说，每次充能完成一层也会触发此事件。
---
function Skill:on_cooldown() end

---
---启用事件
---
---每当使用enable，让技能从禁用状态变为启用状态时触发。
---
function Skill:on_enable() end

---
---禁用事件
---
---每当使用disable，让技能从启用状态变为禁用状态时触发。
---
function Skill:on_disable() end

---
---即将施法事件
---
---每当技能即将发动时触发，此时的技能是施法。在事件中返回false来阻止技能的发动。在阻止技能发动后，会在客户端上显示error文本。
---
---@return boolean 是否允许发动技能
---@return string 错误消息
function Skill:on_can_cast() end

---
---即将打断事件
---
---每当在此技能的施法过程中，想要发动另一个技能时触发。此时的技能和想要发动的另一个技能均
---为施法。在事件中返回true来打断当前施法。瞬发技能不会触发此事件（因为本来不会打断技能）。
---
---@param dest Skill 想要发动的技能
---@return boolean 是否打断施法
function Skill:on_can_break(dest) end

---
---施法开始事件
---
---每当技能技能进入施法开始阶段时触发。此时的技能为施法。
---
function Skill:on_cast_start() end

---
---施法打断事件
---
---每当技能进入施法打断阶段时触发。此时的技能为施法。
---
function Skill:on_cast_break() end

---
---施法引导事件
---
---每当技能进入施法引导阶段时触发。此时的技能为施法
---
function Skill:on_cast_channel() end

---
---施法出手事件
---
---每当技能进入施法出手阶段时触发。此时的技能为施法。
---
function Skill:on_cast_shot() end

---
---施法完成事件
---
---每当技能进入施法完成阶段时触发。此时的技能为施法。
---
function Skill:on_cast_finish() end

---
---施法停止事件
---
---每当技能进入施法停止阶段时触发。此时的技能为施法。
---
function Skill:on_cast_stop() end

---
---施法失败事件
---
---每当技能在进入施法开始之前被验证为施法失败时触发。此时的技能为施法。 进入施法开始后, 框架认为该技能已经成功施法, 所以不会再调用该回调
---
---@param failed_code cast_error_code
function Skill:on_cast_failed(failed_code) end

---
---选择目标时效果
---
function Skill:on_select_target() end

---
---周期性效果
---
function Skill:on_periodic() end

---
---阶段改变时
---
function Skill:on_change_grade() end

---
---槽位变化
---
function Skill:on_change_slot() end

---
---鱼技能蓄力
---
function Skill:on_spell_fish_channel() end

---
---鱼技能出手
---
function Skill:on_spell_fish_shot() end

---
---鱼技能停止
---
function Skill:on_spell_fish_stop() end

---
---接近目标
---
function Skill:on_cast_approach() end


--#endregion 事件

--#region 方法

---
---激活冷却
---
---这个方法有3种用法
---
---1.激活冷却（如同使用了技能）
--- skill:active_cd()
---
---2.按照指定冷却上限来激活冷却
--- skill:active_cd(30)
--- 
---3.按照指定冷却上限来激活冷却，并且决定是否受冷却缩减的影响
--- -- 无视冷却缩减
--- skill:active_cd(30, true)
--- -- 计算冷却缩减
--- skill:active_cd(30, false)
--- 
---@param cd_max? number
---@param total? boolean
function Skill:actove_cd(cd_max, total) end

---
---激活自定义冷却
---
---激活技能自定义冷却，本次冷却与技能内置cd无关。
---当冷却上限为“技能默认最大冷却”时，无需填写当前冷却时间
---否则需要填写冷却上限和当前冷却时间
---
---@param cd_max number | SkillCooldownType
---@param cd? number
function Skill:active_custom_cd(cd_max, cd) end

---
---增加等级
---
---不能在技能的施法事件中改变技能等级。
---
---@param level number
function Skill:add_level(level) end

---
---增加层数
---
---增加技能的层数，会同步给客户端，本质上是一个自定义属性。
---
---@param layers number
function Skill:add_stack(layers) end 

---
---获取数值属性
---
---@param skill_atr SkillAttribute
---@return number
function Skill:get_num(skill_atr) end

---
---设置数值属性
---
---@param skill_atr SkillAttribute
---@param value number
function Skill:set_num(skill_atr, value) end

---
---获取自定义属性
---
---读取技能的数据，对于技能来说，这个操作等价于skill[key]。对于施法来说，则是从它的源技能上读取数据。
---
---@param skill_atr SkillAttribute
---@return any
function Skill:get(skill_atr) end

---
---设置自定义属性
---
---修改技能的属性，并通知给客户端。
---
---@param skill_atr SkillAttribute
---@param value any
function Skill:set_option(skill_atr, value) end

---
---禁用
---
---禁用技能，技能被禁用后将无法使用且不再触发任何事件。
---
function Skill:disable() end

---
---启用
---
---启用技能，取消技能的禁用状态，可以使用并触发事件。
---
function Skill:enable() end

---
---隐藏
---
---隐藏技能，无法在界面上显示，但实际效果仍然生效。
---
function Skill:enable_hidden() end

---
---取消隐藏
---
---取消技能的隐藏状态，使其在界面中显示。
---
function Skill:disable_hidden() end

---
---获取剩余冷却时间
---
---技能的剩余冷却时间，若技能当前没有进入冷却阶段则返回0。
---
---@return number
function Skill:get_cd() end

---
---获取等级
---
---获取技能的等级，默认为技能配置中的初始等级字段。
---
---@return number
function Skill:get_level() end

---
---获取数编Id
---
---如果技能有name属性，则返回name，否则返回技能名。
---
---@return SpellID | string
function Skill:get_name() end

---
---获取槽位编号
---
---获取技能的槽位编号，编号由添加技能时指定或自动指定
---
---@return number
function Skill:get_slot_id() end

---
---获取拥有者
---
---获取技能的拥有者，如果没有拥有者，则返回空。
---
---@return Unit
function Skill:get_owner() end

---
---获取技能类型
---
---技能的技能类型（英雄、通用、攻击、隐藏、物品）
---
---@return AbilSlotType
function Skill:get_type() end

---
---是否为施法实例
---
---判断技能对象是否为施法实例。
---
---@return boolean
function Skill:is_cast() end

---
---是否被启用
---
---判断技能是否被启用。
---
---@return boolean
function Skill:is_enable() end

---
---是否隐藏
---
---判断技能是否处于隐藏状态
---
---@return boolean
function Skill:is_hidden() end

---
---通知伤害
---
---一般用于伤害流程，会产生以下效果：
---
---根据伤害来源、伤害目标、伤害角度与技能播放特效。
---根据伤害来源、伤害目标、伤害角度与技能播放音效。
---令伤害来源显形一段时间。
---令伤害来源与伤害目标的动画树切换为战斗状态。
---
---@param damage DamageInstance
function Skill:notify_damage(damage) end

---
---重新加载脚本
---
---让技能重新加载脚本。不会触发任何事件。
---
function Skill:reload() end

---
---移除
---
---移除技能，会触发“技能-失去时”事件。
---
function Skill:remove() end

---
---设置本次施法使用的动画。
---
---@param anim string
---@deprecated
function Skill:set_animation(anim) end

---
---设置剩余冷却（仅已激活时）
---
---只对已经在冷却状态的技能有效，最小值是0，最大值是当前冷却上限。
---
---@param cd number
function Skill:set_cd(cd) end

---
---设置剩余冷却
---
---设置技能的剩余冷却时间，通常用于缩短冷却，如需延长冷却，勾选强制延长。
---
---@param cd number 冷却 
---@param is boolean 强制激活延长 
function Skill:set_cd_force(cd, is) end

---
---设置等级
---
---不能在技能的施法事件中改变技能等级。
---
---@param level number
function Skill:set_level(level) end

---
---设置是否可升级
---
---@param is_up_level boolean 可升级
---@deprecated
function Skill:set_upgradable(is_up_level) end

---
---发送事件
---
---@param event_name string
---@param ... unknown
function Skill:event_notify(event_name, ...) end

---
---可对目标使用
---
---是否可对目标使用技能（与目标类型、施法范围相关）。
---
---@param target Unit | Point | number | nil
---@param check_range boolean
---@return cast_error_code
function Skill:can_cast(target, check_range) end

---
---是否可供学习
---
---判断技能是否可供学习，当一个技能的当前等级 < 最大等级时，视为该技能可学习。
---
---@return boolean
function Skill:can_learn() end

---
---学习
---
---学习技能（需勾选技能中的启用技能加点），学习成功时触发“单位-学习技能完成时”事件。 
---
---@return boolean
function Skill:learn() end

---
---设置自动施法开关
---
---@param open boolean
function Skill:set_autocast_on(open) end

---
---附加指定物品技能的物品
---
---@return Item
function Skill:get_active_item() end

---
---禁用计数
---
---@return number
function Skill:get_disable_count() end

---
---设置连击段数
---
---@param phase number
function Skill:set_phase(phase) end

---
---技能开关状态
---
---@return boolean
function Skill:is_toggled_on() end

---
---开关技能内置冷却机制
---
---@param is_close boolean
function Skill:ignore_pay_cd(is_close) end

---
---获取技能的充能层数。
---
---@return number
function Skill:get_stack() end

---
---获取最大冷却时间
---
---获取技能的最大冷却时间。公式模式时直接取公式值，否则受计算冷却缩减和施法速度属性影响。
---只能获取普通技能的最大冷却时间，多段技能请使用获取多段技能最大冷却时间。
---
---@return number
function Skill:get_skill_max_cd() end

---
---获取多段技能在某一段的最大冷却时间
---
---@param phase number
---@return number
function Skill:get_multi_phase_max_cd(phase) end

---
---创建直线运动
---
---@param mover_data MoverData
---@return Mover
function Skill:mover_line(mover_data) end

---
---创建追踪运动
---
---@param mover_data MoverData
---@return Mover
function Skill:mover_target(mover_data) end


--#endregion 方法

---
---@type table<string, Skill>
base.skill = setmetatable({}, { 
    ---
    ---__index 元方法
    ---
    ---@param self table
    ---@param name SpellID
    ---@return Skill
    __index = function(self, name) end }
)




---@class Cast : Skill
---
---无限蓄力技能实际蓄力时间
---
---@field infinite_cast_time number
---
local Cast = {}

---
---获取当前阶段
---
---获取当前技能阶段返回int, 如果返回-1表示skill为空，0到4分别表示空闲阶段、CastStart、CastChannel、CastShot、CastFinish。
---
---@return AbilStage
function Cast:get_stage() end

---
---完成当前阶段
---
---立即完成技能当前阶段，使技能进入下一阶段。
function Cast:stage_finish() end

---
---获取上次施法的目标
---
---技能施法的上次施法的目标，返回值类型由技能的目标类型属性决定。
---
---@return nil | Unit | Point | number
function Cast:get_last_target() end

---
---强制停止
---
---强制停止技能施法，若在施法开始阶段，则进入施法打断阶段；否则进入施法停止阶段。
---
---@deprecated 弃用
function Cast:stop() end

---
---是否是同一个技能
---
---对于施法来说会使用源技能进行比较，因此可以用来判断2次施法是不是来自同一个技能。
---
---@param skill Skill
---@return boolean
function Cast:is(skill) end

---
---获取施法目标
---
---仅用于施法，返回值类型由技能的目标类型属性决定。
---
---@return nil | Unit | Point | number
function Cast:get_target() end

---
---打断
---
---若在施法开始阶段，则进入施法打断阶段；否则进入施法停止阶段。
---
function Cast:bail() end

---
---获取施法实例对应的技能对象
---
---@return Skill
function Cast:get_skill() end

---
---设置施法动画
---
---设置当次施法实例所使用的动画。通常只有在技能施法开始阶段设置时才有效。且动画名需要是已经预先加载的动画。
---
---@param anim string
function Cast:set_animation(anim) end

---
---是非主动施法
---
---@return boolean
function Cast:is_acquire_cast() end

---
---实例连击段数
---
---@return number
function Cast:get_phase() end





---
---技能目标类型
---
---@alias SpellTargetType 
---| 0          # 无目标 
---| 1          # 单位目标
---| 2          # 地面目标
---| 3          # 单位或地面目标
---| 4          # 向量目标
---| 5          # 拖动施法


---
---技能冷却类型
---
---@alias SkillCooldownType
---| "MaxCooldown"          # 技能默认最大冷却
---

---
---技能属性
---
---@alias SkillAttribute string
---| 'KnockDistance'        # 击飞距离
---| 'Damage'               # 伤害
---| 'Heal'                 # 治疗


---
---
---
---@class SpellDataCache : DataCache
---
---技能同步方式
---
---@field Sync UnitDataSync
---
---技能图标
---
---字符串类型，输入技能图标资源路径。
---
---@field IconName string
---
---普攻/技能
---
---技能的施法类型，数值类型。
---
---@field skill_type SkillType
---
---编辑器附加数据
---
---技能所需的自定义数据。值需要填写为一个表，然后表中的每个Key-Value对都会在生成Lua文件时添加到SpellData属性的值的表中，如果已有同Key元素，则舍弃‘附加数据’下面的值 */
---
---@field CustomSpellData table
---



