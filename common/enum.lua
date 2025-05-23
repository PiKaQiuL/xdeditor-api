---@meta

---@class Object: table


---
---技能格子类型
---
---@alias AbilSlotType
---| "英雄"
---| "隐藏"
---| "攻击"
---| "通用"
---| "物品"
---



---
---单位类别
---
---@alias UnitClass
---| "阻挡"
---| "英雄"
---| "弹道"
---| "可破坏物体"
---| "生物"
---| "建筑"

---
---单位行为标记
---
---@alias UnitBehaviorState
---| "定身"
---| "缴械"
---| "物免"
---| "魔免"
---| "禁魔"
---| "免死"
---| "隐身"
---| "隐藏"
---| "显影"
---| "召唤"
---| "模型隐藏"
---| "逻辑隐藏"
---| "飞行"
---| "幽灵"
---| "蝗虫"
---| "失控"
---| "天空"
---| "无敌"
---| "免时停"
---| "虚空"


---
---移动结果
---
---@alias WalkResultCode
---| 0      # 成功
---| 1      # 单位已死亡
---| 2      # 无法寻路
---| 3      # 被定身
---| 4      # 无法打断
---| 5      # 无效单位
---| 6      # 正在等待动态碰撞
---| 7      # 已抵达附近
---| 8      # 不可见
---| 9      # 缺少可移动组件


---
---同步方式
---
---@alias SyncType
---| "none"           # 无
---| "self"           # 自身
---| "ally"           # 盟友
---| "sight"          # 视野
---| "self|sight"     # 自身|视野
---| "ally|sight"     # 盟友|视野
---| "all"            # 全部
---



---
---技能阶段
---
---@alias AbilStage
---| -1     # 技能为空
---| 0      # 空闲阶段
---| 1      # 施法前摇
---| 2      # 施法蓄力
---| 3      # 施法引导
---| 4      # 施法后摇
---


---
---验证器代码
---
---@alias ValidatorCode
---| 0              # 通过
---| 1              # 不支持
---| 2              # 错误
---| 3              # 必须以单位为目标
---| 4              # 目标数量不足
---| 5              # 放置空间不足
---| 6              # 无效的单位Id
---| 7              # 无效的玩家
---| 8              # 没有可供执行的对象
---| 9              # 必须以特定种类的单位为目标
---| 10             # 无法以特定种类的单位为目标
---| 11             # 目标超出射程
---| 12             # 目标太近了
---| 13             # 缺少中间单位
---| 14             # 效果已经执行过了
---| 15             # 无法以那个为目标



---
---伤害类型
---
---@alias DamageType string
---| "真实"
---| "魔法"
---| "物理"


---
---单位组件
---
---@alias UnitDataModule
---| "移动"         # 可以进行移动
---| "不朽"         # 死亡后不会被移除
---| "运动"         # 可以进行特殊运动
---


---
---单位标签
---
---@alias UnitLabel
---| "单位"
---| "守卫"
---| "小兵"
---| "兵营"
---| "远程"
---| "英雄"
---| "商店"
---| "近战"
---| "地面"
---| "基地"
---| "野怪"
---| "物品"
---| "作物"
---| "建筑"
---| "弹道"
---| "空中"
---| "箭塔"
---| "泉水"
---| "机械"
---


---
---单位属性子类型
---
---@alias UnitPropertySubTypeEx
---| false    # 基础值
---| true     # 百分比值

---
---可见性
---
---@alias PVisibilitySetting
---| 0      # 默认
---| 1      # 可见
---| 2      # 不可见

---
---飘浮文字配置ID
---
---@alias RiseletterID string
---


---
---施法错误代码
---
---@alias cast_error_code number
---| 0              # 成功
---| 1              # 无法打断前一技能
---| 2              # 冷却中
---| 3              # 生命值不足
---| 4              # 法力值不足
---| 7              # 超出施法范围
---| 8              # 缺少技能或装备
---| 9              # 技能尚未习得
---| 10             # 错误的目标参数
---| 11             # 尝试施放被动技能
---| 12             # 未通过脚本判定
---| 14             # 目标已死亡或被移除
---| 15             # 技能施放受限
---| 17             # 不能释放禁用技能
---| 19             # 施法者已死亡
---| 26             # 需要指定一个目标
---| 28             # 单位未持有物品
---| 29             # 物品没有可使用的技能
---

---
---玩家控制者类型
---
---@alias PlayerController
---| "human"          # 真人
---| "none"           # 无
---| "computer"       # 电脑
---| "ai"             # 电脑
---| "human-ai"       # 真人-AI
---
---

---
---玩家游戏状态
---
---@alias PlayerOnlineState
---| "none"         # 无
---| "online"       # 在线
---| "offline"      # 离线
---


---
---玩家属性
---
---@alias PlayerAttribute
---| "sys_player_nick"
---| "人口上限"
---| "队伍"
---| "镜头目标单位"
---| "复活时间"
---| "英雄ID"
---| "击杀"
---| "助攻"
---| "补刀"
---| "复活时间上限"
---| "英雄类型"
---| "死亡"
---| "金钱"
---| "人口"
---


---
---结盟关系
---
---@alias AllianceState
---| 0      # 盟友
---| 1      # 中立
---| 2      # 敌对
---


---
---网格表现状态
---
---@alias ActorGridState
---| 1    # 禁用
---| 2    # 可用    
---| 3    # 其他    



---
---玩家槽位类型
---
---@alias PlayerSlotType
---| "user"      #  玩家
---| "computer"  #  电脑
---



---
---同步方式
---
---@alias UnitDataSync
---| "ally|sight"       # 同阵营的玩家总是可见(其他玩家有视野才能看得到)
---| "sight"       # 玩家有视野才能看得到
---| "self|sight"       # 所属玩家的单位总是可见(其他玩家有视野才能看得到)
---| "ally"       # 同阵营的总是可见(其他人不可见)
---| "self"       # 所属玩家的单位总是可见(其他人不可见)
---| "all"       # 所有玩家可见
---| "none"       # 所有都不可见


---
---技能类型（不使用）
---
---@alias SkillType
---| 0      # 是近战普攻
---| 1      # 是远程普攻
---| 2      # 是技能


---
---静态碰撞类型
---
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


