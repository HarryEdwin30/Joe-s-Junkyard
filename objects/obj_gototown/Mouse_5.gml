if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
	if (room == Junkyard) {
        if (obj_bossfight_director.fought_horde) {
            obj_bossfight_director.fought_horde = false;
        	room_goto(Town);
        }
    } else if (room == Town) {
        room_goto(Junkyard);
    }
}