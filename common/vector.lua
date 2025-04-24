---@meta Vector



---
---向量
---
---@class Vector
---
---x
---
---@field X number
---
---y
---
---@field Y number
---
---z
---
---@field Z number
---
---
local Vector = {}

---
---向量加法
---
---向量对象加上一个向量，得到一个新向量
---
---@param v2 Vector
---@return Vector
function Vector:vector_addition(v2) end


---
---获取向量长度
---
---@return number
function Vector:get_vector_length() end

---
---获取向量自身的同向单位向量
---
---@return Vector
function Vector:get_unit_vector() end

---
---向量减法
---
---向量对象减去一个向量，得到一个新向量
---
---@param v2 Vector
---@return Vector
function Vector:vector_subtraction(v2) end

---
---向量乘法
---
---向量对象和一个向量进行点乘，得到一个新向量
---
---@param v2 Vector
---@return Vector
function Vector:vector_multiplication(v2) end

