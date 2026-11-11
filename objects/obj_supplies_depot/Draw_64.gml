var heading_str = "Junkyard Stats:"
var bs_str = "Beef Stew: " + string(bs);
var scrap_str = "Scrap: " + string(scrap);

var str0_w = string_width(heading_str);
var str1_w = string_width(bs_str);
var str2_w = string_width(scrap_str);

var widths = [
    str0_w, str1_w, str2_w
];

var t_str_w = widths[0];

for (var i = 0; i < array_length(widths); i++) {
	if (widths[i] > t_str_w) {
    	t_str_w = widths[i];
    }
}

var x1 = gui_x;
var y1 = gui_y;
var x2 = x1 + t_str_w + 2;
var y2 = y1 + 60;

draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_colour(c_red);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_font(fancyfont);

var str0_x = gui_x + 1;
var str0_y = gui_y;
draw_text(str0_x, str0_y, heading_str);

var str1_x = gui_x + 1;
var str1_y = gui_y + 20;
draw_text(str1_x, str1_y, bs_str);

var str2_x = gui_x + 1;
var str2_y = gui_y + 40;
draw_text(str2_x, str2_y, scrap_str);