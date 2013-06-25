os.loadAPI("ocs/apis/sensor")
local prox = sensor.wrap("left")
 
term.redirect(peripheral.wrap("right"))
 
while (true) do
  local targets = prox.getTargets()
  for name, details in pairs(targets) do
    if (math.floor(details["Position"]["Y"]) == -1 and redstone.getInput("front")) then
      print("Detected: " ..name)
      print("X: " .. math.floor(details["Position"]["X"]) .. ", Z: " .. math.floor(details["Position"]["Z"]))
    end
   end
end
 
term.restore()
