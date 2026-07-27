draw_sprite(crosshair, -1, mouse_x, mouse_y);

draw_set_font(fancyfont);
draw_set_colour(c_red);

if global.player_alive = true draw_line(obj_player.x, obj_player.y, mouse_x, mouse_y);