if (array_contains(obj_player.squad, id)) {
    var index = array_get_index(obj_player.squad, id);
	array_delete(obj_player.squad, index, 1);
    glog("removed this dude from your squad", 2);
}