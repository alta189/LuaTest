rednet.open("left")
local floor = 1
local delay = .5
 
function startsWith(str, start)
   return string.sub(str,1,string.len(start)) == start
end
 
function splitString(str)
   lines = {}
   for word in string.gmatch(str, "%w+") do
      table.insert(lines,word)
   end
   return lines
end

function motor(amt, color)
   i = 1
   while (i <= amt) do
      print(i)
      redstone.setBundledOutput("back", color)
      os.sleep(delay)
      redstone.setBundledOutput("back", 0)
      os.sleep(delay)
      i = i + 1
   end
end
 
function up(i)
   motor(i, colors.blue)
   print("up\n")
end
 
function down(i)
   motor(i, colors.black)
   print("down")
end
 
while (true) do
   id,message = rednet.receive()
   if (startsWith(message,"EV1 ")) then
      msg = splitString(message)
      if ((msg[2] == "1") and (floor ~= 1)) then
         if (floor == 2) then
            down(7)
         end
         if (floor == 3) then
            down(12)
         end
         floor = 1
      end
      if (msg[2] == "2" and floor ~= 2) then
         if (floor == 1) then
            up(7)  
         end
         if (floor == 3) then
            down(5)
         end
         floor = 2
      end
      if (msg[2] == "3" and floor ~= 3) then
         if (floor == 1) then
            up(12)
         end
         if (floor == 2) then
            up(5)
         end
         floor = 3
      end
      if (msg[2] == "go") then
         if (msg[3] == "up") then
            up(tonumber(msg[4]))
         end
         if (msg[3] == "down") then
            print("'" .. msg[4] .. "'")
            down(tonumber(msg[4]))
         end
      end
   end
end
