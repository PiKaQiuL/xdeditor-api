---@meta Math





---
---
---
---@class Math
local Math = {}

base.math = Math

---
---正弦
---
---@param r number
---@return number
function Math.sin(r) end

---
---余弦
---
---@param r number
---@return number
function Math.cos(r) end

---
---正切
---
---@param r number
---@return number
function Math.tan(r) end

---
---反正弦
---
---@param v number
---@return number
function Math.asin(v) end

---
---反余弦
---
---@param v number
---@return number
function Math.acos(v) end

---
---反正切
---
---@param v1 number 对边
---@param v2 number 临边
---@return number
function Math.atan(v1, v2) end

---
---向上取整
---
---@param v number
---@return integer
function Math.ceil(v) end

---
---向下取整
---
---@param v number
---@return integer
function Math.floor(v) end

---
---平方根
---
---@param v number
---@return number
function Math.sqrt(v) end

---
---自然指数
---
---@param v number
---@return number
function Math.exp(v) end


---
---对数
---
---@param v1 number 真数
---@param v2 number 底数
---@return number
function Math.log(v1, v2) end


---
---判断两个浮点数a和b是否相等
---
---@param a number
---@param b number
---@return boolean
function Math.float_eq(a, b) end

---
---判断两个浮点数a和b是否不相等
---
---@param a number
---@param b number
---@return boolean
function Math.float_ueq(a, b) end

---
---判断浮点数a是否小于浮点数b
---
---@param a number
---@param b number
---@return boolean
function Math.float_lt(a, b) end

---
---判断浮点数a是否小于或等于浮点数b。
---
---@param a number
---@param b number
---@return boolean
function Math.float_le(a, b) end

---
---判断浮点数a是否大于浮点数b
---
---@param a number
---@param b number
---@return boolean
function Math.float_gt(a, b) end

---
---判断浮点数a是否大于或等于浮点数b
---
---@param a number
---@param b number
---@return boolean
function Math.float_ge(a, b) end

---
---随机浮点数
---
---@param a number 区间下限
---@param b number 区间上限
---@return number
function Math.random_float(a, b) end

---
---随机整数
---
---在闭区间[下限,上限]内随机一个整数。注意:下限和上限的值可以被随机出来
---
---@param a number
---@param b number
---@return number
function Math.random_int(a, b) end

---
---浮点数小数部分（编辑器用）
---
---@param n number
---@return number
function Math.float_modf(n) end

---
---计算2个角度之间的夹角
---
---@param r1 number
---@param r2 number
---@return number
function Math.included_angle(r1, r2) end

---
---插值运算
---
---当t=0返回from，当t=1返回to，当t=0.5返回from和to的平均数
---
---@param from number 起始值
---@param to number 结束值
---@param t number 插值因子（number），范围通常是0到1
---@return number 
function Math.lerp(from, to, t) end

---
---限制数值区间
---
---@param value number 需要限制的值
---@param left number 范围的下限
---@param right number 范围的上限
---@return number
function Math.clamp(value, left, right) end

---
---返回参数中最大的值，
---
---@generic Number: number
---@param ... Number
---@return Number
function Math.max(...) end

---
---返回参数中最小的值，
---
---@generic Number: number
---@param ... Number
---@return Number
function Math.min(...) end

---
---绝对值
---
---@param v number
---@return number
function Math.abs(v) end

---
---次幂
---
---@param v1 number 底数
---@param v2 number 指数
---@return number
function Math.pow(v1, v2) end

---
---平方
---
---@param v number
---@return number
function Math.square(v) end

---
---是整数
---
---若为整数，则返回真，否则，返回假。
---
---@param v number
---@return boolean
function Math.is_int(v) end


---
---向量相加
---
---@param v1 Vector
---@param v2 Vector
---@return Vector
function Math.vector_add(v1, v2) end

---
---向量相减
---
---@param v1 Vector
---@param v2 Vector
---@return Vector
function Math.vector_sub(v1, v2) end

---
---向量数乘
---
---@param v1 Vector
---@param mul number
---@return Vector
function Math.vector_mul(v1, mul) end

---
---点积
---
---@param v1 Vector
---@param v2 Vector
---@return number
function Math.dot_product(v1, v2) end

---
---叉积
---
---@param v1 Vector
---@param v2 Vector
---@return Vector
function Math.dot_product(v1, v2) end
