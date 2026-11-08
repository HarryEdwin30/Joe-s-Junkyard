key = "truck";

max_scrap = 1000;

if (struct_exists(global.data, key)) { //epic copy and paste
	data = global.data[$ key];
}
else {
	data = {
        scrap: 0,
    }
}

scrap = data.scrap;

draw_gui = false;

add_scrap = 0;

gui_x = 250;
gui_y = 200;

drop_rapid_delay_max = 15;
drop_rapid_delay = drop_rapid_delay_max;
time_between_rapid_drops_max = 3;
time_between_rapid_drops = time_between_rapid_drops_max;