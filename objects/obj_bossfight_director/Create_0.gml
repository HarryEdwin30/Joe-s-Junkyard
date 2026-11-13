draw_outline = false;

fought_horde = false;

if (global.game_day == 1) {
	fought_horde = true;
}

horde_triggered = false;

boss1 = false;

function spawn_zombie(type) {
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