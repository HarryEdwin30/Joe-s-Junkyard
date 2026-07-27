

if hp <= 0{
    global.being_attacked = false;
    global.survivors_left -= 1;
    audio_play_sound(death, 0, false);
    if infected = true{
        instance_create_depth(x, y, 0, obj_walker);
    }
    instance_destroy()
}


if global.being_attacked = true{
    getoffme(60, ord("E"));
    exit;
}

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if keyboard_check(vk_shift) is_running = true
    else {
    	is_running = false;
    }

if is_running = true m_spd = 2
    else {
    	m_spd = 1;
    }

var tilemap = layer_tilemap_get_id("obstacles");

move_and_collide(h * m_spd, v * m_spd, tilemap, undefined, undefined, undefined, m_spd, m_spd);