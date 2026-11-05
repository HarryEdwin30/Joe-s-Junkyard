type = "light"; //types: light, medium, heavy
enabled = false;
max_delay = 0;
delay = 0;

toggle = function(new_type) {
    if (enabled && new_type == undefined) {
    	enabled = false;
    } else {
        enabled = true;
        if (type != undefined) {
        	type = new_type;
        }
    }
}

drop_bomb = function() {
    var l = layer_get_id("bomb_layer");
    var max_dist = 100;
    var drop_x = irandom_range(obj_player.x - max_dist, obj_player.x + max_dist);
    var drop_y = irandom_range(obj_player.y - max_dist, obj_player.y + max_dist);
    instance_create_layer(drop_x, drop_y, l, obj_bomb);
}