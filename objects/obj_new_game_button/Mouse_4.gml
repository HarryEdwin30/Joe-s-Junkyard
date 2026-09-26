room_goto(TestRoom);
global.game_started = true;
global.data = {};

if (file_exists("data.json")) {
    file_delete("data.json");
}