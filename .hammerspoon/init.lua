hs.autoLaunch(true)

-- Right Cmd + hjkl -> arrow keys (left Cmd keeps its normal shortcuts).
local LEFT_CMD_BIT = 0x08   -- NX_DEVICELCMDKEYMASK
local RIGHT_CMD_BIT = 0x10  -- NX_DEVICERCMDKEYMASK

local keycodes = hs.keycodes.map
local arrows = {
  [keycodes.h] = keycodes.left,
  [keycodes.j] = keycodes.down,
  [keycodes.k] = keycodes.up,
  [keycodes.l] = keycodes.right,
}

-- Keys whose keyDown was remapped, so their keyUp is remapped too even if
-- right Cmd is released first (otherwise the arrow would stay held).
local held = {}

ArrowTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp }, function(event)
  local code = event:getKeyCode()
  local arrow = arrows[code]
  if not arrow then return false end

  local isDown = event:getType() == hs.eventtap.event.types.keyDown
  local raw = event:rawFlags()
  if not (held[code] or (isDown and raw & RIGHT_CMD_BIT ~= 0)) then return false end
  held[code] = isDown or nil

  local flags = event:getFlags()
  flags.cmd = raw & LEFT_CMD_BIT ~= 0 or nil
  flags.fn = true -- real arrow keys carry the fn flag
  event:setKeyCode(arrow)
  event:setFlags(flags)
  return false
end):start()

-- macOS disables event taps that time out; turn it back on if that happens.
ArrowTapWatchdog = hs.timer.doEvery(5, function()
  if not ArrowTap:isEnabled() then ArrowTap:start() end
end)
