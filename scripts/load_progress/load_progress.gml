function load_progress(){
    if (struct_exists(global.data, "game_progress")) {
	progress_data = global.data[$ "game_progress"]
    }
    else {
    	progress_data = {
            game_day: 1,
        }
    }
    
    global.game_day = progress_data.game_day;
}