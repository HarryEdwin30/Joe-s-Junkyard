var x1 = mx - 145;
var y1 = 1;
var x2 = mx + 140;
var y2 = 40;

draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_colour(c_red);
draw_rectangle(x1, y1, x2, y2, true);