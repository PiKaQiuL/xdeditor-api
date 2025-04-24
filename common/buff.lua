---@meta Buff

---
---BUFF
---
---@class Buff
---
---Buff数据表
---
---@field cache BuffDataCache
---
---数编Id
---
---@field link BuffID
---
---Buff管理器
---
---@field unit_buff UnitBuff
---
---效果节点
---
---@field stack_param EffectParam
---
---当前属性加成列表
---
---@field attributes? UnitPropertyBonus[]
---
---响应节点
---
---@field responses Response[]
local Buff = {};

---
---获取周期
---
---获取Buff的周期，单位为秒。
---
---@return number
function Buff:get_pulse() end

---
---设置周期
---
---设置触发每周期执行的周期，单位为秒。
---
---@param time number
function Buff:set_pulse(time) end

---
---获取剩余时长
---
---获取Buff的剩余时长，单位为秒。
---
---@return number
function Buff:get_remaining() end

---
---设置剩余时长
---
---设置Buff剩余时长，单位为秒。
---
---@param time number
function Buff:set_remaining(time) end

---
---获取总时长
---
---获取Buff的总时长，单位为秒。
---
---@return number
function Buff:get_time() end

---
---设置总时长并重置剩余时长
---
---设置时间，也会重置剩余时间，如果是持续Buff，则取消持续，单位为秒。
---
---@param time number 总时长
function Buff:set_time(time) end

---
---获取层数
---
---获取Buff的层数，默认为1层。
---
---@return number
function Buff:get_stack() end

---
---增加层数
---
---增加Buff层数，会同步到客户端，如果状态的属性允许，层数会显示在状态图标上。
---
---@param count number 层数
function Buff:add_stack(count) end

---
---设置层数
---
---设置Buff层数，默认为1层，会同步到客户端。
---
---@param count number 层数
---@return number
function Buff:set_stack(count) end

---
---移除
---
---移除Buff，触发Buff的全部移除后效果。
---
function Buff:remove() end

---
---是否启用
---
---判断Buff是否启用。
---
---@return boolean
function Buff:is_enabled() end

---
---使用过滤器过滤的结果
---
---使用过滤器过滤Buff的结果，即判断指定Buff是否符合过滤器条件。
---
---@param filter base.target_filters
---@return boolean
function Buff:filter_categories(filter) end

---
---获取Buff单位组的所有单位
---
---@return UnitGroup
function Buff:get_tracked_units() end

---
---设置Buff的等级。
---
---@param level number
function Buff:set_level(level) end

---
---获取Buff的等级。
---
---@return number
function Buff:get_level() end

---
---获取剩余时长
---
---获取Buff的剩余持续时间，单位为秒。
---
---@return number
function Buff:get_remain_time() end

---
---获取存在指定Buff单位组中的所有单位。
---
---@return UnitGroup
function Buff:buff_get_tracked_units_v2() end

---
---获取数编Id
---
---@return BuffID
function Buff:get_name() end

------------------------------------------------------------------------------------







---
---Buff类型
---
---@alias BuffType number
---| 0  #固定BUFF
---| 1  #时间类型BUFF
---| 2  #点数类型buff
---| 3  #时间类型和点数类型的结合

---
---@alias BuffPolarity number
---| 1 #正面
---| 2 #负面
---

---
---Buff分类
---
---@alias BuffCategory string
---|"可被驱散"
---|"可被禁用"
---

---
---显示选项
---
---@class BuffShow : DataCache
---
---是否显示持续时间
---
---若显示则以cd的方式显示
---
---@field IsShowDuration boolean
---
---是否多个实例合并显示
---
---合并的话cd显示最长持续时间，并且把叠加层数加起来
---
---@field IsMergeInstance boolean
---
---是否在即将消息时闪烁
---
---即将消失指持续时间变为2秒以下时，本身若总时间小于2秒则永远不会闪烁
---
---@field IsBlink boolean
---
---是否显示叠加层数
---
---@field IsShowStack boolean
---
---是否显示
---
---@field IsShow boolean
---



---
---Buff标旗
---
---@class BuffFlags : DataCache
---
---死后禁用
---
---死后会禁用Buff
---
---@field DisableWhenDead boolean
---
---允许多个实例
---
---同一单位身上是否可以同时保留多个当前状态的实例
---
---@field AllowMultiInstance boolean
---
---死后不删除
---
---死后不会自动删除buff
---
---@field Permanent boolean
---
---每个施法者刷新各自的实例
---
---来自同一施法者的当前buff每次附加时刷新目标身上的已有实例的持续时间，而非附加新的实例
---
---@field SingleInstancePerCaster boolean
---
---遵循技能加速
---
---周期时间倍率属性会启用
---
---@field UseHaste boolean
---
---需要引导
---
---@field Channeling boolean
---


-----------------------------------------------



---
---Buff数据缓存
---
---@class BuffDataCache : DataCache
---
---获得状态时获得的特效
---
---@field OnAddParticles string[]
---
---此buff生效时的响应效果
---
---@field Responses ResponseID[]
---
---启用Bufff分类
---
---对启用的buff进行名称分类
---
---@field BuffCategoriesEnable string[]
---
---拥有buff持续音效
---
---@field ContinueSound string
---
---Buff附加数据
---
---Buff所需的自定义数据。值需要填写为一个表，然后表中的每个Key-Value对都会在生成Lua文件时添加到ClientBuff属性的值的表中，如果已有同Key元素，则舍弃‘附加数据’下面的值
---
---@field CustomClientBuff table<any,any>
---
---启用技能
---
---启用某个或某些技能
---
---@field SkillsEnable SpellID[]
---
---Buff类型
---
---Buff类型,0为固定buff,1为时间类型buff,2为点数类型buff,3为时间类型和点数类型的结合。
---
---@field BuffType BuffType
---
---残影开始时间
---
---残影从[0，1]开始显示使用时间。
---
---@field GhostStartTime number
---
---显示选项
---
---勾选buff显示的需求
---
---@field BuffShow BuffShow
---
---添加单位状态
---
---添加buff的同时，给单位添加一种或多种特殊或(自定义)状态，自定义状态在常量配置里面自定义
---
---@field AddRestrctions UnitRestriction[]
---
---动态材质 - 结束值
---
---@field DynamicMatParamValueEnd string
---
---残影显示时间
---
---残影完全显示时间
---
---@field GhostDuraTime number
---
---失去状态时获得的特效
---
---@field OnRemoveParticles string[]
---
---禁用技能
---
---禁用某个或某些技能
---
---@field SkillsDisable SpellID[]
---
---模型缩放需要时间
---
---@field DynamIcScaleElapse number
---
---动态材质 - 参数值类型
---
---@field DynamicMatParamType string
---
---残影间隔时间
---
---两个残影出现的时间间隔
---
---@field GhostInterValTime number
---
---所属单位名
---
---@field OwnerUnit string
---
---禁用技能分类
---
---对禁用的技能进行名称分类
---
---@field SkillCategoriesDisable string[]
---
---刷新时效果
---
---当一个实例被另一个实例取代时引发
---
---@field RefreshEffect EffectID
---
---是否获得buff时冻结动画
---
---@field bNoSkelUpdate boolean
---
---设置Contorl前经过的时间
---
---附加该buff时，设置Control前经过的时间
---
---@field OnAddControlElapse number
---
---自定义分类
---
---Buff的自定义分类，效果或者其他buff可按照分类来批量禁用/启用拥有特定分类特征的buff
---
---@field Categories BuffCategory[]
---
---Buff极性
---
---属于正面增益还是负面减益buff
---
---@field BuffPolarity BuffPolarity
---
---移除Control的blendtime
---
---移除该Buff时,设置Control的blendtime。
---
---@field OnRemoveBlendTime number
---
---每周期执行
---
---按照周期的时间，每个周期执行的效果
---
---@field PeriodicEffect EffectID
---
---动态材质 - 退出时间
---
---退出时间(例：渐变类材质需要多少时间淡出)。
---
---@field DynamicDetachMatElapse number
---
---Buff图标
---
---Buff图标,如果为空,则表示不显示
---
---@field BuffIcon string
---
---初始效果
---
---此Buff刚开始生效的效果
---
---@field InitialEffect EffectID
---
---添加Buff子模型变化
---
---添加Buff时子模型的显示和隐藏列表。
---
---@field OnAddSubModelChange OnSubModelChange
---
---Buff标旗
---
---勾选所需buff所需的需求
---
---@field BuffFlags BuffFlags
---
---隐藏全部特效
---
---是否隐藏身上所有通过buff添加的特效,1-是。
---
---@field KillBuffEffect YesOrNo
---
---周期时间倍率属性
---
---实际周期时间 = 设定周期时间 / 周期时间倍率
---
---@field AttributeHaste SpellAttackSpeedAttribute
---
---
local BuffDataCache = {}


---@alias BuffID string


---
---Buff管理器
---
---@class UnitBuff
---
---Buff数编Id
---
---@field link BuffID
---
---Buff数编表
---
---@field cache BuffDataCache
---
---所属单位
---
---@field unit Unit
---
---默认效果节点
---
---@field default_param EffectParam
---
---所有表现
---
---@field actors Actor[]
---
local UnitBuff = {}
---
---获取
---
---@param unit Unit
---@param BuffId BuffID
---@return UnitBuff
function UnitBuff.get(unit, BuffId) end
