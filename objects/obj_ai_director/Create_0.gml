spawn_delay = 0;
max_zombies = 125;
enabled = false;

spawn_zombie = function(type) {
    var spawn = {x: 0, y: 0};
    var dist = 500;
    var min_x = obj_player.x - dist;
    var max_x = obj_player.x + dist;
    var min_y = obj_player.y - dist;
    var max_y = obj_player.y + dist;
    var sides = ["l", "r", "t", "b"];
    for (var i = 0; i < 3; i++) {
        var index = irandom_range(0, array_length(sides) - 1);
        var side = sides[index];
        switch (side) {
        	case "l":
                spawn.x = min_x;
                spawn.y = irandom_range(min_y, max_y);
                break;
            case "r":
                spawn.x = max_x;
                spawn.y = irandom_range(min_y, max_y);
                break;
            case "t":
                spawn.x = irandom_range(min_x, max_x);
                spawn.y = min_y;
                break;
            case "b":
                spawn.x = irandom_range(min_x, max_x);
                spawn.y = max_y;
                break;
        }
        if (!position_meeting(spawn.x, spawn.y, global.closed_obstacles) and point_in_rectangle(spawn.x, spawn.y, 0, 0, room_width, room_height)) {
        	var ml = layer_get_id("mainlayer");
            instance_create_layer(spawn.x, spawn.y, ml, type);
            break;
        }
        array_delete(sides, index, 1);
    }
}