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

if (position_meeting(mouse_x, mouse_y, id)) {
	if (point_distance(x, y, obj_player.x, obj_player.y) < 128) {
        draw_set_colour(c_red);
        var x12 = x - sprite_width / 2;
        var y12 = y - sprite_height / 2;
        var x22 = x12 + sprite_width;
        var y22 = y12 + sprite_height;
        draw_rectangle(x12, y12, x22, y22, true);
    }
}