---@meta Actor

---@alias ActorID string
---@alias ParticleID string
---@alias SoundID string



---
---表现
---
---
---@class Actor
---
---
---@field cache ActorDataCache
---
local Actor = {}

---
---销毁表现
---
---force (bool) - 不填默认为false，
--- - 对ModelActor，true表示不播放death动画，直接销毁。
--- - 对SoundActor, false表示当前Sound立刻开始按照ActorSoundData里FadeTime淡出，淡出后销毁actor
--- 
---@param force? boolean 不填默认为false
function Actor:destroy(force) end

---
---设置表现所属玩家
---
---影响该表现对于不同玩家的可见性
---
---@param owner_id number 玩家的slot_id
function Actor:set_owner(owner_id) end

---
---设置地面相对高度
---
---设置表现在场景中的相对于地面的高度，一次性设置。“设置位置”和“设置地面相对高度”方法中，后调用的覆盖先调用的。
---
---@param height number
function Actor:set_ground_z(height) end

---
---设置位置
---
---设置表现在场景中的位置，设置附着之后，设置表现位置视为设置相对于父节点的偏移
---
---@param where Point
function Actor:set_position(where) end

---
---设置朝向
---
---设置表现在场景中的平面内朝向
---
---@param face number 等价于欧拉角roll, 绕z轴旋转值
function Actor:set_facing(face) end


---
---替换资源
---
---动态替换表现的资源，比如模型表现换模型，音效表现换音效，特效表现换特效
---
---@param asset ModelID | ParticleID | SoundID
function Actor:set_asset(asset) end

---
---设置是否显示影子
---
---仅对拥有CEAnimatedModel的模型表现生效，显示或隐藏阴影
---
---@param enable boolean
function Actor:set_shadow(enable) end

---
---设置缩放
---
---设置表现在场景中的比例大小
---
---@param x number 三个维度的比例大小均为x
function Actor:set_scale(x) end

---
---播放
---
---播放音效/特效，当前支持音效/特效表现
---
function Actor:play() end

---
---停止
---
---停止音效/特效，当前支持音效/特效表现 如果是模型表现，则表示停止动画，开始播放待机动画。如果当前没有播放动画。则没有效果。
---
function Actor:stop() end

---
---暂停音效
---
---暂停音效，当前只支持音效表现
---
function Actor:pause() end

---
---继续音效
---
---继续播音效，当前只支持音效表现
---
function Actor:resume() end

---
---设置音量
---
---设置音量，当前只支持音效表现
---
---@param volume number
function Actor:set_volume(volume) end

---
---设置发射点z高度
---
---设置激光表现发射点的z高度。若激光表现的发射源为一个点，该函数可以修改改点的3D高度。
---
---@param z number
function Actor:set_launch_ground_z(z) end

---
---设置发射点位置
---
---设置激光表现发射位置的坐标，光束可以从一个单位身上发射也可以从一个点发射。
---
---@param point Point
function Actor:set_launch_scene_point(point) end

---
---设置发射源单位和绑点
---
---设置激光表现发射位置的单位和绑点，光束可以从一个单位身上发射也可以从一个点发射。
---
---@param unit Unit
---@param socket string
function Actor:set_launch_site(unit, socket) end

---
---设置文字
---
---可修改3D文字表现的文字。注意文字表现与漂浮文字并不是一样的概念。
---
---@param text string
function Actor:set_text(text) end

---
---设置缩放
---
---@param x number
---@param y number
---@param z number
function Actor:set_scale_xyz(x, y, z) end

---
---设置表现在场景中的朝向
---
---@param x number 欧拉角pitch, 绕x轴旋转值
---@param y number 欧拉角yaw, 绕y轴旋转值
---@param z number 欧拉角roll, 绕z轴旋转值
function Actor:set_rotation(x, y, z) end

---
---将表现附着在别的表现或者单位上
---
---@param unit Unit | Actor | UnitID
---@param socket? string
function Actor:attach_to(unit, socket) end

---
---模型特效播放动画
---
---@param anim string  模型表现Asset路径下的某个动画文件名，不带.ani
---@param params? table 通过表传播放参数，可以不填，当前支持loop(默认false),speed(默认1.0)
function Actor:play_animation(anim, params) end



---
---创建表现
---
---[查看文档](简介 | 星火编辑器文档-https://doc.sce.xd.com/%E6%8A%80%E6%9C%AF%E6%96%87%E6%A1%A3/%E6%9C%8D%E5%8A%A1%E7%AB%AFLua%20API/%E8%A1%A8%E7%8E%B0/%E7%AE%80%E4%BB%8B)
---
---@param actor_id ActorID
---@param exclude? number[] 哪些玩家不需要创建表现, 比如2表示玩家1,2客户端不需要创建表现, 不填默认为
---@param sync? boolean  attach_to单位后是否跟单位同步(即跟单位一起在视野出现或消失), 默认为true。典型应用场景是ForceOneShot=1的模型表现，如果sync=true，单位再次出现再视野的时候会播stand、death动画然后销毁；如果sync=false，单位再次出现在视野里时，表现不会出现。
---@return Actor
function base.actor(actor_id, exclude, sync) end

---
---获取当前所有的id到actor映射表
---
---
---@return table
function base.actor_info() end



---
---
---
---@class ActorDataCache : DataCache
---@


