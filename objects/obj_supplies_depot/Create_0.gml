key = "supplies_depot";
    
if (struct_exists(global.data, key)) { //epic copy and paste
	data = global.data[$ key];
}
else {
	data = {
        bs: 0,
        scrap: 0
    }
}

bs = data.bs;
scrap = data.scrap;

gui_x = 1;
gui_y = 1;