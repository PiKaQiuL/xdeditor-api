---@meta Score



---
---云变量id
---
---@class ScoreID
---


---
---云变量对象数据
---
---@class ScoreObjData
---
---云变量id
---
---@field objectId ScoreID
---
local ScoreObjData = {
    ---
    ---更新时间
    ---
    ---@deprecated
    updatedAt = ''
}



---
---云变量查询条件
---
---@class ScoreGetParam
---
---用户id
---
---@field _user_id UserID | UserID[]
---
---云变量名
---
---@field key string | string[]
---

---
---云变量数据
---
---@class ScoreData
---
---用户id
---
---@field user_id UserID
---
---云变量名
---
---@field key string
---
---云变量id
---
---@field objectId ScoreID
---
---创建时间
---
---@field createdAt string
---
---更新时间
---
---@field updatedAt string
---
---值
---
---@field value any
---
---数值
---
---@field i_value number
---
---字符值
---
---@field s_value string
---


---
---云变量货币数据
---
---@class ScoreMoneyData 
---
---用户id
---
---@field user_id UserID
---
---云变量名
---
---@field key string
---
---云变量id
---
---@field objectId ScoreID
---
---创建时间
---
---@field createdAt string
---
---更新时间
---
---@field updatedAt string
---
---值
---
---@field value number
---

---
---消息已读状态
---
---@alias ReadStatus 
---| 1      # 已读
---| 0      # 未读
---

---
---消息删除状态
---
---@alias DeleteStatus 
---| 1      # 已删除
---| 0      # 未删除
---




---
---云变量消息发送参数
---
---@class ScoreMsgSendParam 
---
---消息源用户id
---
---@field src_user_id UserID
---
---消息名
---
---@field _key string
---
---消息目标用户id
---
---@field target_user_id UserID
---
---已读状态
---
---@field read ReadStatus
---
---删除状态
---
---@field deleted DeleteStatus
---
---消息值
---
---@field value table
---


---
---云变量消息数据
---
---@class ScoreMsgData
---
---云变量对象id
---
---@field objectId ScoreID
---
---消息名
---
---@field key string
---
---消息值
---
---@field value string
---
---已读状态
---
---@field read ReadStatus
---
---删除状态
---
---@field deleted DeleteStatus
---
---创建时间
---
---@field createdAt string
---
---更新时间
---
---@field updatedAt string
---
---发送用户id
---
---@field src_user_id UserID
---
---接收用户id
---
---@field target_user_id UserID
---


---
---云变量消息查询条件
---
---@class ScoreMsgQueryParam
---
---源用户id
---
---@field src_user_id UserID
---
---目标用户id
---
---@field target_user_id UserID
---
---消息名
---
---@field _key string
---
---已读状态
---
---@field read ReadStatus


---
---云变量列表数据
---
---@class ScoreListData 
---
---用户id
---
---@field user_id UserID
---
---云变量名
---
---@field key string
---
---云变量id
---
---@field objectId ScoreID
---
---创建时间
---
---@field createdAt string
---
---更新时间
---
---@field updatedAt string
---
---列表值
---
---@field value any
---
---列表项id
---
---@field uuid ScoreListID
---

---
---云变量列表项id
---
---@class ScoreListID
