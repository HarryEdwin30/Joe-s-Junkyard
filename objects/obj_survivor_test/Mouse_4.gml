if (array_length(obj_player.squad) < obj_player.squad_max_size) {
    if (!array_contains(obj_player.squad, id)) {
    	array_push(obj_player.squad, id);
        glog("added this dude to your squad", 2);
    }
}