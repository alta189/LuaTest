os.loadAPI("ocs/apis/sensor")
local prox = sensor.wrap("left")

term.redirect(peripheral.wrap("right"))
local x = 0
local y = 0

while (true) do
  local targets = prox.getTargets()
  for name, details in pairs(targets) do
    print("Detected: " ..name)
    if (math.floor(details["Position"]["Z"]) == -1 and (math.floor(details["Position"]["X"]) ~= x or math.floor(details["Position"]["Y"]))) then
      print("X: " .. math.floor(details["Position"]["x"]) .. ", Y: " .. math.floor(details["Position"]["Y"]))
    end
   end
end

term.restore()
