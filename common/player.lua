---@meta Player


---
---玩家
---
---@class Player
---
---id
---
---@field id number
---
local Player = {}

---
---控制者
---
---玩家的控制者，会是以下值中的一个：
--- - human - 用户
--- - none - 空位
--- - computer - 电脑
--- - ai - AI 
--- -human-ai - 像人AI
--- 
--- @return PlayerController
function Player:controller() end

---
---获取主控单位
---
---玩家的主控单位，如果玩家没有英雄，则返回nil。
---
---@return Unit?
function Player:get_hero() end

---
---锁定镜头缩放
---
---锁定镜头后，玩家无法通过鼠标滚轮改变镜头状态,手机上禁用双指改变镜头。使用[unlock_camera_by_mouse_wheel]解锁滚轮。
---
function Player:lock_camera_by_mouse_wheel() end

---
---获取玩家的槽位编号
---
---@return number
function Player:get_slot_id() end

---
---锁定镜头
---
---锁定镜头后，玩家无法通过客户端操作改变镜头状态，set_camera无效。使用unlock_camera解锁镜头。
---
function Player:lock_camera() end

---
---是否已放弃游戏
---
---放弃游戏的玩家无法再重连回游戏。
---
---@return boolean
function Player:is_abort() end

---
---将玩家踢出游戏。
---
---@param server_records string
---@param client_records string
function Player:kick(server_records, client_records) end

---
---创建单位
---
---创建出来的单位由player控制。如果name是一个字符串，那么会创建名称为name的单位。如果name是一个单位，那么会复制该单位，目前该行为等同于create_illusion。单位创建后会最先执行on_init，你可以在这里给单位初始化一些数据。创建单位的流程如下：
--- - 执行on_init
--- - 触发单位-初始化事件
--- - 添加技能
--- - 触发[单位-创建]事件
---
---@param unit_id UnitID
---@param point Point
---@param angle number
---@return Unit?
---@deprecated
function Player:create_unit(unit_id, point, angle) end

---
---创建物品
---
--创建出来的物品所有者为player。当target为点，物品会创建在地上；当target为单位，物品会创建在单位身上，但如果该单位的
---
---@param item_id ItemID
---@param point Point
---@return Item?
function Player:create_item(item_id, point) end

---
---获取玩家的队伍编号。
---
---@return number
function Player:get_team_id() end

---
---游戏状态
---
---玩家的游戏状态，会是以下值中的一个
--- - none - 空位
--- - online - 在线
--- - offline - 离线
---
---@return PlayerOnlineState
function Player:game_state() end

---
---增加玩家属性值
---
---会同步给客户端。
---
---@param player_attribute PlayerAttribute
---@param value number
function Player:add(player_attribute, value) end

---
---获取玩家数值属性值
---
---会同步给客户端。
---
---@param player_attribute PlayerAttribute
---@return number
function Player:get_num(player_attribute) end

---
---设置玩家数值属性值
---
---会同步给客户端。
---
---@param player_attribute PlayerAttribute
---@param value number
function Player:set_num(player_attribute, value) end

---
---获取自定义属性
---
---@param player_attribute PlayerAttribute
---@return any
function Player:get(player_attribute) end

---
---设置自定义属性
---
---@param player_attribute PlayerAttribute
---@param value any
function Player:set(player_attribute, value) end

---
---获取玩家的退出原因
---
---@return string
function Player:leave_reason() end

---
---将玩家设置为挂机状态。
---
function Player:set_afk() end

---
---设置玩家主控单位
---
---并且该单位的拥有者更改为该玩家。
---
---@param unit Unit
function Player:set_hero(unit) end

---
---设置队伍编号
---
---设置玩家队伍编号，默认编号在数编配置中。
---队伍编号将影响玩家的敌对与盟友等关系。
---
---@param team_id number 队伍编号
function Player:set_team_id(team_id) end

---
---解锁玩家镜头
---
---镜头将不再跟随玩家。
---
function Player:unlock_camera() end

---
---用户客户端
---
---用于分辨用户使用的客户端，该值由客户端上传。
---
---@return string
function Player:user_agent() end

---
---用户虚拟ID
---
---TapTap上的用户ID。能保证每个用户唯一。
---
---@return UserID
function Player:user_id() end

---
---用户信息
---
---类型为英雄时，返回用户可用英雄的名单；类型免费英雄时，返回用户免费英雄的名单；类型为养成时，返回用户使用的符卡名单。
---
---@param type string
---@return any
function Player:user_info(type) end

---
---玩家的用户等级
---
---@return number
function Player:user_level() end

---
---玩家的用户名
---
---@return string
---@deprecated
function Player:get_user_name() end

---
---用户昵称
---
---玩家的用户昵称，默认情况下显示的是帐号用户名。除非经过修改昵称函数的修改。
---
---@return string
function Player:get_nick_name() end

---
---用户自定义属性
---
---玩家的用户自定义属性，属性为在config.ini里写的user_info
---
---@param attribute string
---@return any
---@deprecated
function Player:get_user_info(attribute) end

---
---获取鼠标位置
---
---获取玩家的鼠标位置，将映射为场景中的点。
---
---这个属性是由客户端上传的，需要客户端支持鼠标才有意义。
---
---@return Point
function Player:input_mouse() end

---
---获取摇杆方向
---
---这个属性是由客户端上传的，需要客户端支持摇杆才有意义。如果摇杆是松开状态，则返回nil。
---
---@return number?
function Player:input_rocker() end

---
---为玩家播放音乐
---
---@param music_id string
---@deprecated
function Player:play_music(music_id) end

---
---播放音效
---
---播放音效。多次播放的音效互不影响。当[玩家的英雄]与点的距离超过截断距离时，将听不到音效。
---
---@param music_id string
function Player:play_sound(music_id) end

---
---使镜头跟随单位
---
---@param unit? Unit
function Player:camera_focus(unit) end

---
---已连入过
---
---@return boolean
function Player:is_online() end

---
---局外组队队伍Id
---
---玩家在局外组队时的队伍Id，相同局外队伍Id的玩家可认为是组队进入游戏的。
---
---@return number
function Player:get_match_team_id() end

---
---敌友关系
---
---判断两个玩家间的结盟关系，其枚举有：盟友、中立、敌对。
--- - 0 若两个玩家处于同一队伍，该函数会返回“盟友”。 
--- - 1 若不处于同一个队伍，但其中一个玩家是中立玩家，该函数会返回“中立”。
--- - 2 若不处于同一个队伍，且两者都不是中立玩家，则会返回“敌对”。
--- 
---@param other Player
---@return AllianceState
function Player:alliance_state(other) end

---
---判断玩家是否是中立玩家。
---
---@return boolean
function Player:is_neutral() end

---
---开关中立玩家状态
---
--- - 当一个玩家被设置为中立玩家时，代表它与其它任何玩家的敌我关系都至少为“中立”，不可能与任何一个玩家的关系成为“敌对”。
--- - 当中立玩家与一个玩家处于同一个队伍时，这两个玩家之间的关系仍为“盟友”。
--- - 中立玩家影响AI索敌过滤、技能过滤、与搜索效果过滤。设置为“需要：敌方”的搜索效果会无法对中立玩家的单位起作用。中立玩家所引发的“需要：敌方”的搜索效果也无法对其它任何玩家生效（因为中立玩家看其它玩家也都至少为中立）。
--- 
---@param neutral_state boolean
function Player:set_is_neutral(neutral_state) end

---
---开关强制单向共享视野
---
---可以强制令一个玩家对另一个不同势力的玩家单方面共享视野，或将之取消。
---
---@param other Player
---@param is_enabled boolean
function Player:toggle_force_share_sight(other, is_enabled) end

---
---强制向玩家共享视野
---
---@param other Player
function Player:share_sight_to_player(other) end

---
---取消向玩家共享视野
---
---@param other Player
function Player:remove_share_sight_to_player(other) end

---
---发送事件
---
---@param event_name string
---@param ... unknown
function Player:event_notify(event_name, ...) end

---
---修改显示昵称
---
---可以修改一个玩家的显示用昵称，对真人用户和NPC玩家都有效。
---
---注意这里修改的昵称只会在当局游戏内生效，且只会影响玩家的显示名，不会影响用户在Tap上的昵称。
---对于真人玩家的昵称修改需要在该玩家第一次连入后进行。因为玩家的昵称会在玩家第一次连入后被其用户昵称所覆盖。
---
---@param new_name string
function Player:set_nick_name(new_name) end

---
---设置玩家主控单位技能同步方式
---
---@param sync_type SyncType
function Player:set_hero_skill_sync_type(sync_type) end

---
---清除玩家的主控单位
---
function Player:clear_hero() end

---
---自定义统计
---
---@param event_name string
---@param table table<string, string | boolean | number>
function Player:event_stat(event_name, table) end







