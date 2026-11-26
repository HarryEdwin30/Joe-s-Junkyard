if (global.save_game) {
	data.infected = infected;
    data.hp = hp;
    data.hungry = hungry;
    
    global.data[$ key] = data;
}