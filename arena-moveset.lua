----------------
-- Teching v2 --
----------------

--[[
local TECH_KB = {
    [ACT_GROUND_BONK]             = ACT_BACKWARD_ROLLOUT,
    [ACT_BACKWARD_GROUND_KB]      = ACT_BACKWARD_ROLLOUT,
    [ACT_HARD_BACKWARD_GROUND_KB] = ACT_BACKWARD_ROLLOUT,
    [ACT_HARD_FORWARD_GROUND_KB]  = ACT_FORWARD_ROLLOUT,
    [ACT_FORWARD_GROUND_KB]       = ACT_FORWARD_ROLLOUT,
}

local tech_tmr = 0

local function mario_on_set_action(m)
    if TECH_KB[m.action] then
        tech_tmr = 0
    end
end

local function mario_update(m)
if TECH_KB[m.action] then
    tech_tmr = tech_tmr + 1
        if tech_tmr <= 9.9 and (m.input & INPUT_Z_PRESSED) ~= 0 then
            m.vel.y = 21.0
            m.particleFlags = m.particleFlags | ACTIVE_PARTICLE_SPARKLES
            tech_tmr = 0
            return set_mario_action(m, TECH_KB[m.action], 1)
        end
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)
hook_event(HOOK_ON_SET_MARIO_ACTION, mario_on_set_action)
]]