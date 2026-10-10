if (global.save_game) {
	data.open = open;
    data.broken = broken;
    data.hp = hp;
    
    global.data[$ key] = data;
}