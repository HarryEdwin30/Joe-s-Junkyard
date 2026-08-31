if global.player_alive = false exit;
    
if enabled = false exit;

var sz = instance_position(obj_player.x, obj_player.y, obj_sz_parent);

var max_zombies = 125;

var zombies = instance_number(obj_zombie_parent);


if instance_number(obj_walker) > 0{
    var walker_percent = (instance_number(obj_walker) / zombies) * 100;
    show_debug_message("w: " + string(walker_percent));
}

if instance_number(obj_runner) > 0{
    var runner_percent = (instance_number(obj_runner) / zombies) * 100;
    show_debug_message("r: " + string(runner_percent));
}

var z_min_dist = 700;
var z_max_dist = 800;

var tilemap = layer_tilemap_get_id("obstacles");

if sz != noone{
    if zsdl <= 0 and zombies < max_zombies and sz.zia > 0{
        zsdl = sz.zsd;
        
        var spawn_x = irandom_range(obj_player.x - z_max_dist, obj_player.x + z_max_dist);
        var spawn_y = irandom_range(obj_player.y - z_max_dist, obj_player.y + z_max_dist);
        
        while (point_distance(spawn_x, spawn_y, obj_player.x, obj_player.y) < z_min_dist or ((spawn_x < 0 and spawn_x > room_width) or (spawn_y < 0 or spawn_y > room_height)) or (place_meeting(spawn_x, spawn_y, tilemap))){
        	spawn_x = irandom_range(obj_player.x - z_max_dist, obj_player.x + z_max_dist);
            spawn_y = irandom_range(obj_player.y - z_max_dist, obj_player.y + z_max_dist);
        }
        
        var zombie_type_to_spawn = sz.zt[irandom(array_length(sz.zt) - 1)];
        instance_create_depth(spawn_x, spawn_y, 0, zombie_type_to_spawn);
        sz.zia -= 1;
    }
    zsdl -= 1;
}