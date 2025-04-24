---@meta Quest




---@alias QuestID string


---
---任务
---
---@class Quest
---
---Id
---
---@field link QuestID
---
---编号
---
---@field id number
---
---所属单位
---
---@field owner Unit
---
---任务目标列表
---
---@field conditions QuestCondition[]
---
---激活状态
---
---@field active QuestConditionActive
---
---完成
---
---@field complete QuestConditionComplete
---
---进度
---
---@field progress number
---
---总进度
---
---@field progressTotal number
---
---是否可提交
---
---@field can_submit boolean
---
local Quest = {}

---
---重置
---
function Quest:reset() end

---
---激活
---
function Quest:activate() end

---
---取消激活
---
function Quest:deactivate() end

---
---提交
---
function Quest:submit() end

---
---当前任务目标
---
---@return QuestCondition?
function Quest:get_current_condition() end

---
---将云变量类型的任务绑定给玩家
---
---@param player Player 玩家
---@param on_success fun(arg: ScoreObjData[]) 绑定成功时
---@param on_error fun(arg1: number, arg2: string) 绑定失败时
function Quest:bind_to_user(player, on_success, on_error) end

---
---将云变量任务解除对玩家的绑定
---
---@param on_success fun(arg1: ScoreObjData[]) 解绑成功时
---@param on_error fun(arg1: number, arg2: string) 解绑失败时
function Quest:unbind_to_user(on_success, on_error) end

---
---移除
---
function Quest:remove() end


---@alias QuestConditionID string

---
---任务目标
---
---@class QuestCondition
---
---Id
---
---@field link QuestConditionID
---
---编号
---
---@field id number
---
---所属任务
---
---@field quest Quest
---
---所属单位
---
---@field owner Unit
---
---
---激活状态
---
---@field active QuestConditionActive
---
---完成状态
---
---@field complete QuestConditionComplete
---
---速度
---
---@field progress number
---
---总进度
---
---@field progressTotal number
---
---是否可提交
---
---@field can_submit boolean
---
local QuestCondition = {}

---
---设置进度
---
---@param progress number
function QuestCondition:set_progress(progress) end

---
---增加进度
---
---@param progress number
function QuestCondition:add_progress(progress) end

---
---设置激活状态
---
---@param state QuestConditionActive
function QuestCondition:set_active_state(state) end

---
---设置完成状态
---
---@param state QuestConditionComplete
function QuestCondition:set_complete_state(state) end

---
---提交
---
function QuestCondition:submit() end

---
---任务激活状态
---
---@alias QuestConditionActive
---| "inactive"     # 未激活
---| "active"       # 已激活


---
---任务完成状态
---
---@alias QuestConditionComplete
---| "none"         # 未完成
---| "completed"    # 已完成
---| "failed"       # 已失败
