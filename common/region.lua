---@meta Region

---@class Region
local Region = {}

---
---
---获取区域内一个随机点。
---
---@return Point 场景中的随机点
function Region:scene_random_point() end

---
---区域的几何中心点
---
---@return Point 
function Region:get_scene_point() end

---
---开启事件
---
---开启区域事件，区域能够响应[区域-进入]和[区域-离开]事件
---
function Region:init_region() end

---
---关闭区域事件。
---
function Region:remove_region() end


---------------------------------------------------------------------------------------------

---矩形区域
---@class RegionRect: Region
local RegionRect = {}

---
---
---获取矩形区域的宽度（Y轴方向长度）
---
---@return number 长方形区域的宽度
function RegionRect:get_width() end

---
---
---获取矩形区域的高度（Z轴方向长度）
---
---@return number 长方形区域的高度
function RegionRect:get_height() end


----------------------------------------------------------------------------------------------------

---圆形区域
---@class RegionCircle: Region
local RegionCircle = {}

---
---
---获取圆形半径
---
---@return number 圆形半径
function RegionCircle:get_range() end
