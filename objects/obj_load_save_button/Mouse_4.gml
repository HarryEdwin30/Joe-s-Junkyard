if (file_exists("data.json")) {
    var _buffer = buffer_load("data.json");
    global.data = json_parse(buffer_read(_buffer, buffer_string));
    buffer_delete(_buffer);
}
else {
	show_debug_message("gng you have no save file");
    exit;
}

if (struct_exists(global.data, global.save_key)) {
    var data = global.data[$ global.save_key];
    var room_to_go_to = data.current_room;
    room_goto(room_to_go_to);
    global.game_started = true;
}