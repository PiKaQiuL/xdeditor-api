---@meta


---@class base
base = {}

---@class base.Game
base.game = {}



local p = base.ui.panel('s')({
    layout = {
        position = {
            1,
            2
        },
    },
    event = {

    }
})


local ui, bind = base.ui.create(p)

base.game:event("你好", function(trig, ...)
    log.info(trig, ...)
end)

---@type Buff
local buff

local c = buff.cache

local s = c.OnAddParticles

---@class Player
local Player

