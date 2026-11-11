var x1 = gui_x - 3;
var y1 = gui_y;
var x2 = gui_x + 40;
var y2 = gui_y + 24;
draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_colour(c_red);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_font(fancyfont);
var str = "Day " + string(global.game_day);
draw_text(gui_x, gui_y + 1, str);