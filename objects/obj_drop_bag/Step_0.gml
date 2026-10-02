var co = 3; //this is to make it so that the hitbox is smaller, so larger number smaller yeh HAHAHAHAHAHAHA
//i added this because if you are percise enough, you can just barely get the chests and the bag to overlap which iz not goodz

//lord forgive me this if statement is long, specific, and cursed
if (!global.menu and point_distance(obj_player.x, obj_player.y, cx, cy) < global.mdfc and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, global.closed_obstacles, true, true) and mouse_x >= x + co and mouse_x <= x + sprite_width - co and mouse_y >= y + co and mouse_y <= y + sprite_height - co) {
    draw_outline = true;
    if mouse_check_button_pressed(mb_right){
        if draw_gui = false{
            if (!global.menu) {
                audio_play_sound(chest_open, 0, false);
                draw_gui = true;
                obj_player.can_move = false;
                global.menu = true;
            }
        }
    }
}
else if (draw_outline) {
	draw_outline = false;
}

if draw_gui = true{
    
    if bs_tamount + scrap_tamount + rev_tamount + sho_tamount + rif_tamount + zc_tamount > 0{ // most epic if statement ever written???!
    draw_take_options = true;
    }
    else draw_take_options = false;

    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    var dbutton_size = 16; //this can be used for both width and height because the drop button is a square
    
    var dbutton_x1 = 245;
    var dbutton_x2 = dbutton_x1 + dbutton_size;
    
    var bs_dbutton_y1 = 190;
    var bs_dbutton_y2 = bs_dbutton_y1 + dbutton_size;
    
    var scrap_dbutton_y1 = 215;
    var scrap_dbutton_y2 = scrap_dbutton_y1 + dbutton_size;
    
    var rev_ammo_dbutton_y1 = 240;
    var rev_ammo_dbutton_y2 = rev_ammo_dbutton_y1 + dbutton_size;
    
    var sho_ammo_dbutton_y1 = 265;
    var sho_ammo_dbutton_y2 = sho_ammo_dbutton_y1 + dbutton_size;
    
    var rif_ammo_dbutton_y1 = 290;
    var rif_ammo_dbutton_y2 = rif_ammo_dbutton_y1 + dbutton_size;
    
    var zev_cake_dbutton_y1 = 315;
    var zev_cake_dbutton_y2 = zev_cake_dbutton_y1 + dbutton_size;
    
    if (keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_tab)) {
        draw_gui = false;
        obj_player.can_move = true;
        bs_tamount = 0;
        scrap_tamount = 0;
        rev_tamount = 0;
        sho_tamount = 0;
        rif_tamount = 0;
        zc_tamount = 0;
        
        audio_play_sound(chest_close, 0, false);
        
        global.menu = false;
    }
    
    //here we're gonna detect if the mouse is hovering over the buttons
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{ //all the drop buttons are at the same x
        //this is caveman activity and copy paste from backpack
        if mouse_gui_y >= bs_dbutton_y1 && mouse_gui_y <= bs_dbutton_y2{ // beef stew
            if mouse_check_button_pressed(mb_left){
                if bs_tamount < bs{
                    bs_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if bs_tamount != bs{
                    bs_tamount = bs;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    bs_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_tamount < bs{
                            bs_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if bs_tamount > 0{
                    bs_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_tamount > 0{
                            bs_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= scrap_dbutton_y1 && mouse_gui_y <= scrap_dbutton_y2{ // scrap
            if mouse_check_button_pressed(mb_left){
                if scrap_tamount < scrap{
                    scrap_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_tamount < scrap{
                            scrap_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if scrap_tamount != scrap{
                    scrap_tamount = scrap;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    scrap_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if scrap_tamount > 0{
                    scrap_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_tamount > 0{
                            scrap_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rev_ammo_dbutton_y1 && mouse_gui_y <= rev_ammo_dbutton_y2{ // rev_ammo
            if mouse_check_button_pressed(mb_left){
                if rev_tamount < rev_ammo{
                    rev_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if rev_tamount != rev_ammo{
                    rev_tamount = rev_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    rev_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_tamount < rev_ammo{
                            rev_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rev_tamount > 0{
                    rev_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_tamount > 0{
                            rev_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= sho_ammo_dbutton_y1 && mouse_gui_y <= sho_ammo_dbutton_y2{ // sho ammo
            if mouse_check_button_pressed(mb_left){
                if sho_tamount < sho_ammo{
                    sho_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if sho_tamount != sho_ammo{
                    sho_tamount = sho_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    sho_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_tamount < sho_ammo{
                            sho_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if sho_tamount > 0{
                    sho_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_tamount > 0{
                            sho_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rif_ammo_dbutton_y1 && mouse_gui_y <= rif_ammo_dbutton_y2{ // rif ammo
            if mouse_check_button_pressed(mb_left){
                if rif_tamount < rif_ammo{
                    rif_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_tamount < rif_ammo{
                            rif_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if rif_tamount != rif_ammo{
                    rif_tamount = rif_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    rif_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rif_tamount > 0{
                    rif_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_tamount > 0{
                            rif_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= zev_cake_dbutton_y1 && mouse_gui_y <= zev_cake_dbutton_y2{ // zev cakes
            if mouse_check_button_pressed(mb_left){
                if zc_tamount < zev_cakes{
                    zc_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_tamount < zev_cakes{
                            zc_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if zc_tamount != zev_cakes{
                    zc_tamount = zev_cakes;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    zc_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if zc_tamount > 0{
                    zc_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_tamount > 0{
                            zc_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
    } //caveman activity completed
    
    if draw_take_options = true{
        var take_y1 = obj_y + 50;
        var take_y2 = take_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
                if mouse_gui_y >= take_y1 && mouse_gui_y <= take_y2{
                    if mouse_check_button_pressed(mb_left){
                        var new_weight = obj_backpack.weight + ((bs_tamount * obj_backpack.bs_weight) + (scrap_tamount * obj_backpack.scrap_weight) + (rev_tamount) + (sho_tamount) + (rif_tamount * obj_backpack.rif_ammo_weight) + (zc_tamount * obj_backpack.zev_cake_weight))
                        if new_weight > obj_backpack.max_weight{
                            audio_play_sound(cant_do_that, 0, false);
                        }
                        else{
                            audio_play_sound(bp_select, 0, false);
                            obj_backpack.bs += bs_tamount;
                            obj_backpack.scrap += scrap_tamount;
                            obj_backpack.rev_ammo += rev_tamount;
                            obj_backpack.sho_ammo += sho_tamount;
                            obj_backpack.rif_ammo += rif_tamount;
                            obj_backpack.zev_cakes += zc_tamount;
                            
                            bs -= bs_tamount;
                            scrap -= scrap_tamount;
                            rev_ammo -= rev_tamount;
                            sho_ammo -= sho_tamount;
                            rif_ammo -= rif_tamount;
                            zev_cakes -= zc_tamount;
                            
                            bs_tamount -= bs_tamount;
                            scrap_tamount -= scrap_tamount;
                            rev_tamount -= rev_tamount;
                            sho_tamount -= sho_tamount;
                            rif_tamount -= rif_tamount;
                            zc_tamount -= zc_tamount;
                        }
                    }
                }
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                if mouse_check_button_pressed(mb_left){
                    audio_play_sound(item_add_back, 0, false);
                    bs_tamount = 0;
                    scrap_tamount = 0;
                    rev_tamount = 0;
                    sho_tamount = 0;
                    rif_tamount = 0;
                    zc_tamount = 0;
                }
            }
        }
    }
}
/*
 * i didn't even add anything today but it's late at night and i want to talk to myself again
 * 
 * i did music all day
 * 
 * and for 16 measures i'm not even sure sound good
 * 
 * sometimes i can't tell if my music is bad
 * 
 * and  i hate those moments
 * 
 * i guess a good rule of thumb is that if i don't like it on the first playback, then it sucks
 * 
 * but i don't usually give up on the idea
 * 
 * well
 * 
 * the newest thing i'm doing is outside my comfort zone
 * 
 * but if i never step out of it i won't ever grow
 * 
 * i'll just make catchy boss fight themes forever
 * 
 * but all boss fight themes to me are just the same
 * 
 * you do and intro then go into the them, or just jump straight into the theme
 * 
 * then you do a counter theme after it. for me, it has many times been a slow melody with little to no percussion
 * 
 * not always like that though
 * 
 * and after that you basically just do a few minutes of other stuff that's catchy, but not as catchy as the main theme
 * 
 * and then you finish with the main theme
 * 
 * that's my person boss fight formula
 * 
 * i've been trying out other stuff lately
 * 
 * stuff longer than 2 minutes
 * 
 * stuff with little percussion, and more feeling
 * 
 * boss fight songs make you feel cool, but i want to capture more powerful emotions
 * 
 * and i think i did a good job with plague.wav and everything's fine
 * 
 * tremendae maiestatis was really good back when i made that
 * 
 * i don't know how i managed to cook that up
 * 
 * now i'm trying to do something much more complicated and classical
 * 
 * it's very hard to do it right
 * 
 * if it's not near absolute perfection it just sounds corny
 * 
 * and i think it sounds corny to me, at least a good amount of it does
 * 
 * but i'll get better
 * 
 * i've got like 50 seconds of it, and it's subpar at the least
 * 
 * not quite my taste, but it's something i'd listen to if i was desperate
 * 
 * i'm less proud of actually making it and more proud of the fact that i didn't throw it all away because one part sounded corny
 * 
 * it's hard to tell when a melody is not going to work
 * 
 * and it's hard to throw it away anyway because you put time into it
 * 
 * but i think i just saw the potential the melody had
 * 
 * i'm not very good at music theory
 * 
 * but i know enough to where i don't just write random notes until they sound good
 * 
 * i have always favored notation
 * 
 * i would only use a daw for messing with the audio quality, i would never compose in there
 * 
 * and the stuff i make in musescore doesn't even sound bad if i just import custom soundfonts
 * 
 * i always compose in a minor c major because there are no black keys, and i am familiar with the notes corresponding to the scale degrees
 * 
 * and when i'm done composing i just transpose to whatever key fits best
 * 
 * but sometimes i forget
 * 
 * plague.wav was not supposed to stay in a minor, but i forget, uploaded it, and decided "oh well"
 * 
 * a minor is my favorite key though so whatever
 * 
 * it's a pretty dark, epic key, and it's simple
 * 
 * my favorite major key is g major
 * 
 * it's simple and playful
 * 
 * i feel like i can never be taken seriously because of how weird and pathetic i've been before
 * 
 * i don't want to be a joke, but my life so far has just been one
 * 
 * and i am the reason it is
 * 
 * i don't know why i was like that
 * 
 * and i don't know how i decided i didn't want to be like that
 * 
 * for the most part no one has ever truly held me accountable
 * 
 * and out of nowhere several months ago i just kind of "woke up"
 * 
 * maybe it's because i started making music and actually doing something with my stupid life
 * 
 * and i can not tell if it's too late to be shit
 * 
 * am i already too bad of a person to ever be a decent or good person?
 * 
 * is it ever too late to start trying?
 * 
 * and if not, is it even worth it if you are so far deep that not a single being will care if you were gone anyway?
 * 
 * i mean why put in the work to change and possibly fail when you could just give up and never possibly hurt anyone again?
 * 
 * when i see stories on some of the most evil people, i find it hard to feel any hatred
 * 
 * all i can think about is what they are probably thinking about
 * 
 * do they care?
 * 
 * do they feel how i feel?
 * 
 * i believe in determinism, but i don't at the same time
 * 
 * i feel like everything i do is entirely under my control
 * 
 * every character i type is my choice
 * 
 * but if i had gotten hit by a truck on the way back home and died, then i wouldn't have been able to type these characters
 * 
 * and that would be out of my control
 * 
 * i think it's possible that evil people could have been good people if some things out of their control either happened or didn't happen
 * 
 * but if that is possible, than where does the blame go?
 * 
 * if there's another life where i (with nothing changed about my biology) am a murderer or a rapist,
 * 
 * then am i technically responsible for that version of me in this life?
 * 
 * they would literally be me, only circumstances out of my control would be different
 * 
 * with regular punishment logic, that means i should be locked up for the rest of my life
 * 
 * how do you punish if you can't give a perfect punishment?
 * 
 * should you even punish for the purpose of vengeance?
 * 
 * if all you do to a murderer is lock them up in a cell so they can't hurt anyone, but they can still live a decent, meaningful life in there,
 * 
 * then who is still getting hurt?
 * 
 * if we make that person suffer instead, it's possible we could be doing the wrong thing
 * 
 * and what about people who have been falsely imprisoned?
 * 
 * now i don't believe in any religion but i'm pretty sure jesus said that we shouldn't punish others in this life because we can't possibly give the right punishment
 * 
 * because man is imperfect
 * 
 * but god is perfect, and it knows exactly what each of us deserves
 * 
 * maybe it's best we try to keep everyone safe and happy
 * 
 * even the bad people
 * 
 * and i don't think i believe this to make me feel any better about myself
 * 
 * it actually just makes me feel worse
 * 
 * but logically it makes sense to me
 * 
 * and there are one or two people i fucking hate
 * 
 * and it's ok to hate people
 * 
 * if someone wronged you, it's ok to dislike them
 * 
 * but i feel like wanting or needing to see the people you hate suffer is overall illogical to me, and it makes you more like them
 * 
 * i've never been wronged so badly before, so maybe i just don't know
 * 
 * and i'm not trying to say that everyone deep down is a good person
 * 
 * cuz that's just not true
 * 
 * i am an asshole
 * 
 * there's people that have done things beyond comprehension
 * 
 * pure evil
 * 
 * what i'm saying is that i think it's possible that you don't get to choose who you are
 * 
 * moral luck
 * 
 * idk
 * 
 * i'm not cutting myself tonight i don't wanna deal with the logistics
 * 
 * it's mission impossible trying to get the knife
 * 
 * i still don't have a boyfriend to cuddle with
 * 
 * if i ever fall in love i'll be surprised
 * 
 * i am genuinely just a pure cannibalistic humanoid underground dweller
 * 
 * i wonder what it's like
 * 
 * would i be too nervous to ever try and date somebody?
 * 
 * or when you really fall in love, do you pursue it?
 * 
 * well i would assume by then i would already be very comfortable with them
 * 
 * i don't know
 * 
 * i'll keep whoever the fuck is reading this posted if i ever score
 * 
 * (peter griffin ascii art)
 * */
if bs = 0 && scrap = 0 && rev_ammo = 0 && sho_ammo = 0 && rif_ammo = 0 && zev_cakes = 0{
    obj_player.can_move = true;
    global.menu = false;
    draw_gui = false;
    instance_destroy();
}