-- This is a simple mock for the cc api 
-- built as I go
-- simply import with dofile("cc.lua") to use locally 

local redstone = {
  getSides = function()
    return {"left", "right"}
  end
}
