os.loadAPI("ocs/apis/sensor")
local prox = sensor.wrap("left")
 
while (true) do
  local targets = prox.getTargets()
  local found = false
  for name, details in pairs(targets) do
    if (math.floor(details["Position"]["Y"]) == -1) then
      print("Detected: " ..name)
      local x = math.floor(details["Position"]["X"])
      local z =  math.floor(details["Position"]["Z"])
      if ((x >= -3 and x <= 7) and (z >= -7 and x <= 4)) then
         found = true
      end
    end
  end
  redstone.setOutput("back", not found)
  os.sleep(.5)
end
