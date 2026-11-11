if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
	if (room == Junkyard) {
    	room_goto(Town);
    } else if (room == Town) {
        room_goto(Junkyard);
        global.game_day += 1;
    }
}