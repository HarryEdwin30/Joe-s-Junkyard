if global.player_alive = false exit;
    
if obj_player.can_move = false exit;
    
if global.draw_esc_menu_gui = true{
    exit;
}
    
rif_shoot_delay = 0;

if weapon_type = 4{
    if ham_target_in_range = true and global.being_attacked = false{
        var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
        var stamina_to_lose = (ham_base_stamina_usage * ham_charge) * 6;
        if stamina_to_lose > obj_player.stamina{
            stamina_to_lose = obj_player.stamina;
        }
        var damage_to_deal = (stamina_to_lose / 6) * 2;
        deal_damage(damage_to_deal, sound_to_play, ham_target);
        obj_player.stamina -= stamina_to_lose;
        audio_play_sound(ham_hit, 0, false);
    }
    ham_target_in_range = false;
    ham_draw_target = false;
    ham_charge = 0;
    ham_can_play_max_charge_sound = true;
}