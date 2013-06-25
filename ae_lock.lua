os.loadAPI("ocs/apis/sensor")
local prox = sensor.wrap("left")

term.redirect(peripheral.wrap("right"))

while (true) do
  local targets = prox.getTargets()
  for name, details in pairs(targets) do
    print("Detected: " ..name)
    print("Position: " textutils.serialize(details["Position"]))
end

term.restore()
