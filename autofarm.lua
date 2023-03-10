-- autofarm

-- constants 
DIR_LEFT = 0
DIR_RIGHT = 1
DIR_UP = 2
DIR_DOWN = 3
DIR_FRONT = 4
DIR_BACK = 5

FACE_PO_X = "x"
FACE_PO_Y = "y"
FACE_PO_Z = "z"
FACE_MI_X = "-x"
FACE_MI_Y = "-y"
FACE_MI_Z = "-z"

-- Settings

-- The turtle will return here 
-- when the inventory is filled up
HOME = {
  [FACE_X] = 0,
  [FACE_Y] = 0,
  [FACE_Z] = 0,
}
INITIAL_FACING = FACE_PO_X
-- where to dump inventory 
HOME_DUMP_INVENTORY_DIRECTION = DIR_FRONT
HOME_FUEL_INVENTORY_DIRECTION = DIR_UP

function update_position(state, direction) 
end

function forward(state)
  turtle.forward()
  update_position(state, 1)
end

function back(state)
  turtle.back()
  update_position(state, -1)
end

function main()
  local state = {
    loc = HOME,
    facing = INITIAL_FACING
  }
end

main()
