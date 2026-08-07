display_set_gui_size(640, 480);

draw_healthbar(5, 465, 105, 475, hp, c_red, c_lime, c_lime, 0, true, true);

var stamina_hb = (stamina / max_stamina) * 100;

draw_healthbar(5, 465 - 12, 105, 475 - 12, stamina_hb, c_red, c_aqua, c_aqua, 0, true, true);