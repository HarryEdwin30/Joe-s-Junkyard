if (instance_exists(obj_backpack)) { //indeed we will check this every fucking frame ; )
	if (obj_backpack.bs > 0) {
    	bs = obj_backpack.bs;
        obj_backpack.bs = 0;
    }
    if (obj_backpack.scrap > 0) {
    	scrap = obj_backpack.scrap;
        obj_backpack.scrap = 0;
    }
}