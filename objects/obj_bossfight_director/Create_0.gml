key = "boss_director";

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
} else {
    data = {
        been_to_town: false
    }
}

been_to_town = data.been_to_town;

draw_outline = false;

fought_horde = false;

horde_triggered = false;

boss1 = false;
boss2 = false;
boss3 = false;
boss4 = false;
boss5 = false;
boss6 = false;
boss7 = false;

max_delay = 0;
delay = 0; //event timer

spawn_zombie = function(type) {
    var sx = 0;
    var sy = 0;
    var location = choose("t", "b", "l", "r");
    switch (location) {
    	case "t": // these stand for top, bottom, left, and right, but you knew that.
            sx = irandom_range(0, room_width);
            break;
        case "b":
            sx = irandom_range(0, room_width);
            sy = room_height - 1; // subtract by 1 pixel or else they will get stuck
            break;
        case "l":
            sy = irandom_range(0, room_height);
            break;
        case "r":
            sy = irandom_range(0, room_height);
            sx = room_width - 1;
            break;
    }
    var ml = layer_get_id("mainlayer");
    instance_create_layer(sx, sy, ml, type);
}