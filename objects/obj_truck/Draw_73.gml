var str = "Scrap: " + string(scrap) + " / " + string(max_scrap);

var xx = x - 50;
var yy = y - 50;

var x1 = xx - 3;
var y1 = yy - 3;
var x2 = xx + string_width(str) + 3;
var y2 = yy + string_height(str) + 3;

draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_colour(c_red);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_font(fancyfont);
draw_text(xx, yy, str);