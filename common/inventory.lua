---@meta Inventory


---
---物品栏
---
---@class Inventory
---
---物品格（数组）
---
---@field slots Slot[]
---
---物品栏数遍表
---
---@field cache ItemContainerDataCache
---
local Inventory = {}

---
---能否放置物品
---
---判断背包能否放置物品。
---
---@param item Item
---@return boolean
function Inventory:can_hold(item) end

---
---放置物品
---
---向背包内放置物品，如无法放置，则返回false
---如果背包为装备栏，则该语句的效果是装备物品
---
---@param item Item
---@return boolean
function Inventory:add_item(item) end

---
---获取格子
---
---从物品栏获取指定编号的格子，没有则返回空值
---
---@param slot_num number
---@return Slot?
function Inventory:get_slot(slot_num) end

---
---为指定物品栏动态添加格子
---
---@param slot_id InventorySlotID
function Inventory:add_slot(slot_id) end

---
---锁定
---
---锁定指定物品栏使其无法存放物品，锁定时存在物品会强制移出物品栏
---
function Inventory:lock() end

---
---解锁
---
---解锁被锁定的物品栏，不会解锁物品栏格子
---
function Inventory:unlock() end

---
---设置物品栏状态
---
---@param state_type InventoryState
---@param state boolean
function Inventory:set_state(state_type, state) end



---
---物品栏状态
---
---@alias InventoryState string
---| "pick_up_flag"     # 可拾取
---| "move_flag"        # 可移动
---| "move_out_flag"    # 可移出
---| "move_in_flag"     # 可移入
---| "use_flag"         # 可使用
---| "locked"           # 锁定
---




---
---格子ID
---
---@alias InventorySlotID string

---
---物品栏ID
---
---@alias ItemContainerID string


---
---物品栏类型
---
---@alias InventoryContainerClass string
---| "D"    #D（特殊背包 显示在左侧）
---| "C"    #C类（显示为快捷包）
---| "F"    #F（特殊背包 显示为快捷包）
---| "E"    #E（特殊背包 显示在右侧）
---| "H"    #H（自定义UI逻辑）
---| "G"    #G（自定义UI逻辑）
---| "B"    #B类（显示在右侧）
---| "A"    #A类（显示在左侧）


---
---物品栏标旗
---
---@class InventoryFlags : DataCache
---
---可拾取
---
---玩家执行拾取操作时，将当前物品栏视为可选进包的物品栏。如果为否，即使其他物品栏都满了，物品也无法在拾取时自动进入这个物品栏。（不影响使用其他方式将地面上的物品放入物品栏）
---
---@field PickUp boolean
---
---可移入
---
---玩家可以通过操作将物品移入这个物品栏。若为否，即使交换操作也无法使别的物品栏的物品进入这个物品栏。
---
---@field MoveIn boolean
---
---可移出
---
---玩家可以通过操作将物品移出这个物品栏。若为否，即使交换操作也无法使物品离开这个物品栏。
---
---@field MoveOut boolean
---
---可移动
---
---可以移动物品栏里的物品。（若为否，隐含无法移出）
---
---@field Move boolean
---
---可使用
---
---可以使用物品栏里的物品。（即使用其主动技能）
---
---@field Use boolean




---
---背包/装备栏
---
---@class ItemContainerDataCache
---
---界面布局
---
---@field ContainerClass InventoryContainerClass
---
---格子定义
---
---@field Slots InventorySlotDataCache[]
---
---物品栏标旗
---
---@field InventoryFlags InventoryFlags
---
---名称
---
---@field Name string
---
---数编Id
---
---@field Link ItemContainerID





---
---物品栏格子
---
---@class Slot
---
---所属物品栏
---
---@field inventory Inventory
---
---装载的物品
---
---@field item Item | nil
---
---格子数遍表
---
---@field cache InventorySlotDataCache
---
local Slot = {}

---
---能否放置物品
---
---判断格子能否放置物品（与物品是否存在、物品是否合法、格子是否过滤物品标签以及是否能够合并放置物品相关）。
---
---@param item Item
---@return boolean
function Slot:can_hold(item) end

---
---能否合并放置物品
---
---判断格子能否合并放置物品（与物品最大堆叠数相关）。
---
---@param item Item
---@return boolean
function Slot:can_absorb(item) end

---
---合并放置物品
---
---往格子中合并放置物品，如无法合并，则没有任何效果且无返回值。
---
---@param item Item
function Slot:absorb(item) end

---
---放置物品
---
---向格子中放置物品，如无法放置，则返回false
---如果格子为装备格，则该语句的效果是装备物品
---
---@param item Item
---@return boolean
function Slot:assign(item) end

---
---锁定
---
---锁定指定格子使其无法存放物品，锁定时存在物品会强制移出格子
---
function Slot:lock() end

---
---解锁
---
---解锁被锁定的物品栏格子
---
function Slot:unlock() end



---
---物品分类ID
---
---@alias ItemClassID string


---
---物品栏格子数遍表
---
---@class InventorySlotDataCache : DataCache
---
---为空时提示信息
---
---@field TooltipEmpty string
---
---物品不能有分类ID
---
---@field Excluded ItemClassID[]
---
---物品必须有分类ID
---
---@field Required ItemClassID[]
---
---为空时图标
---
---@field Icon string
---
---绑点
---
---@field Socket string
---
---是装备格
---@field Equip boolean
---
---赋予物品的标签
---
---@field GrantTag string


