if (keyboard_check_pressed(ord("E"))) {
	global.data[$ global.save_key] = {
        current_room: room,
        player_x: obj_player.x,
        player_y: obj_player.y
    }
    global.save_game = true;
}