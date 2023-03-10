-- autofarm

-- constants 
DIR_LEFT = 0
DIR_RIGHT = 1
DIR_UP = 2
DIR_DOWN = 3
DIR_FRONT = 4
DIR_BACK = 5

FACE_X = "x"
FACE_Y = "y"
FACE_Z = "z"

-- Settings

-- The turtle will return here 
-- when the inventory is filled up
HOME = {
  [FACE_X] = 0,
  [FACE_Y] = 0,
  [FACE_Z] = 0,
}
FACING = FACE_X
-- where to dump inventory 
HOME_DUMP_INVENTORY_DIRECTION = DIR_FRONT
HOME_FUEL_INVENTORY_DIRECTION = DIR_UP

function forward(state)
  turtle.forward()
  state.loc.x = state.loc.x + 1
end

function back(state)
  turtle.back()
  state.loc[FACING] = state.loc.x - 1
end

function main()
  local state = {
    loc = HOME,
    facing = INITIAL_FACING
  }
end

main()
