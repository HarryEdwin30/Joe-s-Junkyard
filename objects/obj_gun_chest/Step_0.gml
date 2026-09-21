if (obj_retard.gc_handled) {
	if (!iexist) {
    	instance_destroy();
    }
}

switch (gun) {
	case 1:
        if (obj_weapon.rev_unlocked) {
        	opened = true;
        }
        break;
    case 2:
        if (obj_weapon.sho_unlocked) {
        	opened = true;
        }
        break;
    case 3:
        if (obj_weapon.rif_unlocked) {
        	opened = true;
        }
        break;
}

if (!opened) {
	image_index = 0;
}
else {
	image_index = 1;
}