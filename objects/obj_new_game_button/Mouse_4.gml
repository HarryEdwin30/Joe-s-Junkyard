room_goto(Junkyard);
global.game_started = true;
global.data = {};

if (file_exists("data.json")) {
    file_delete("data.json");
}

load_progress();