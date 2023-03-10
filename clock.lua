-- clock 
 
ENABLE_MONITOR = true 
MONITOR_SIDE = "right"
COLOR = colors.white
BG_COLOR = colors.black
MINUTE_COLOR = colors.red 
HOUR_COLOR = colors.blue
 
function init_monitor(side)
	local monitor = peripheral.wrap(side)
	monitor.setTextScale(0.5)
	term.redirect(monitor)
end 
 
function draw_circle(x0, y0, radius, color)
	local x = radius
	local y = 0
	local err = 0
	local err = 0
 
	while (x >= 0) do 
		paintutils.drawPixel(x0 + x, y0 + y, color);
		paintutils.drawPixel(x0 + y, y0 + x, color);
		paintutils.drawPixel(x0 - y, y0 + x, color);
		paintutils.drawPixel(x0 - x, y0 + y, color);
		paintutils.drawPixel(x0 - x, y0 - y, color);
		paintutils.drawPixel(x0 - y, y0 - x, color);
		paintutils.drawPixel(x0 + y, y0 - x, color);
		paintutils.drawPixel(x0 + x, y0 - y, color);
 
		if (err <= 0) then 
			y = y + 1;
			err = err + 2*y + 1;
		end 
 
		if (err > 0) then 
			x = x - 1;
			err = err - 2*x + 1;
		end 
	end 
 
end
 
function draw_minute_hand(h, length, cx, cy, color)
	angle = 2.0*math.pi*h
	draw_hand(length, angle, cx, cy, color)
end 
 
function draw_hour_hand(h, length, cx, cy, color)
	angle = 2.0*math.pi*h/12.0
	draw_hand(length, angle, cx, cy, color)
end 
 
 
function draw_hand(length, angle, cx, cy, color)
	hx = cx + length * math.sin(-angle)
	hy = cy + length * math.cos(-angle)
 
	paintutils.drawLine(cx, cy, hx, hy, color)
end 
 
function render()
	term.setBackgroundColor(BG_COLOR)
	term.clear()
	x, y = term.getSize()
	draw_circle(x/2, y/2, y/2, COLOR)
 
 
	draw_minute_hand(os.time(), y/3, x/2, y/2, MINUTE_COLOR)
	draw_hour_hand(os.time(), y/4, x/2, y/2, HOUR_COLOR)
end
 
function main() 
	if ENABLE_MONITOR then 
		init_monitor(MONITOR_SIDE)
	end 
	while true do 
		os.sleep(1)
		render()
	end 
 
end 
 
main()
