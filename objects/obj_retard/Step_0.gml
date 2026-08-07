global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    global.player_alive = false;
}