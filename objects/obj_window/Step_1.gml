if (global.save_game) {
	data.hp = hp;
    data.broken = broken;
    data.boards = boards;
    
    global.data[$ key] = data;
}