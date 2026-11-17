if (draw_gui) {
    var mguix = device_mouse_x_to_gui(0);
    var mguiy = device_mouse_y_to_gui(0);
    
    if (keyboard_check_pressed(vk_tab)) {
    	obj_player.can_move = true;
    	draw_gui = false;
        global.menu = false;
        audio_play_sound(chest_close, 0, false);
        add_rev = 0;
        add_sho = 0;
        add_rif = 0;
    }
    var x1 = gui_x;
    var y1 = gui_y;
    var x2 = x1 + 300;
    var y2 = y1 + 100;
    
    draw_set_colour(c_black);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_colour(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
    
    var textx = gui_x + 5;
    
    var spc = 20; //spacing
    
    var revstr = "Revolver Ammo: " + string(rev_ammo);
    var revy = gui_y + 5;
    
    var shostr = "Shotgun Ammo:  " + string(sho_ammo);
    var shoy = revy + spc;
    
    var rifstr = "Rifle Ammo:     " + string(rif_ammo); //this is coderot
    var rify = shoy + spc;
    
    draw_set_font(fancyfont);
    
    draw_text(textx, revy, revstr);
    draw_text(textx, shoy, shostr);
    draw_text(textx, rify, rifstr);
    
    var bx = textx + 135;
    
    var rev_img = 0;
    var sho_img = 0;
    var rif_img = 0;
    
    var rev_reserve = rev_ammo;
    var sho_reserve = sho_ammo;
    var rif_reserve = rif_ammo;
    
    if (mode == "give") {
    	rev_reserve = obj_backpack.rev_ammo;
        sho_reserve = obj_backpack.sho_ammo;
        rif_reserve = obj_backpack.rif_ammo;
    }
    
    var bw = sprite_get_width(spr_drop_button);
    var bh = sprite_get_height(spr_drop_button);
    
    if (point_in_rectangle(mguix, mguiy, bx, revy, bx + bw, revy + bh)) {
    	rev_img = 1;
        var reserve = rev_reserve;
        add_rev = la_peace(add_rev, reserve);
    } else if (point_in_rectangle(mguix, mguiy, bx, shoy, bx + bw, shoy + bh)) {
    	sho_img = 1;
        var reserve = sho_reserve;
        add_sho = la_peace(add_sho, reserve);
    } else if (point_in_rectangle(mguix, mguiy, bx, rify, bx + bw, rify + bh)) {
    	rif_img = 1;
        var reserve = rif_reserve;
        add_rif = la_peace(add_rif, reserve);
    }
    
    var operation = "-";
    if (mode == "give") {
    	operation = "+";
    }
    
    var addx = bx + 20;
    
    if (rev_reserve != 0) {
    	draw_sprite(spr_drop_button, rev_img, bx, revy);
    }
    if (sho_reserve != 0) {
    	draw_sprite(spr_drop_button, sho_img, bx, shoy);
    }
    if (rif_reserve != 0) {
    	draw_sprite(spr_drop_button, rif_img, bx, rify);
        
    }
    
    if (add_rev != 0) {
    	var add_str = string(operation) + string(add_rev);
        draw_text(addx, revy, add_str);
    }
    if (add_sho != 0) {
    	var add_str = string(operation) + string(add_sho);
        draw_text(addx, shoy, add_str);
    }
    if (add_rif != 0) {
    	var add_str = string(operation) + string(add_rif);
        draw_text(addx, rify, add_str);
    }
    
    var bpstr_x = addx + 50;
    
    var revbpstr = "BP: " + string(obj_backpack.rev_ammo);
    var shobpstr = "BP: " + string(obj_backpack.sho_ammo);
    var rifbpstr = "BP: " + string(obj_backpack.rif_ammo);
    
    draw_text(bpstr_x, revy, revbpstr);
    draw_text(bpstr_x, shoy, shobpstr);
    draw_text(bpstr_x, rify, rifbpstr);
    
    /* don't flame me codingjesus i know how bad this is and
     * i know that it would be better to use objects for all these buttons n shit but
     * i'd rather just brute force it
     * */
    
    //mode button
    
    var mbx1 = gui_x + 260;
    var mby1 = gui_y + 5;
    var mbx2 = mbx1 + 35;
    var mby2 = mby1 + 22;
    
    var mbstr = "Mode";
    
    var mbstr_x = mbx1 + 3;
    var mbstr_y = mby1;
    
    if (point_in_rectangle(mguix, mguiy, mbx1, mby1, mbx2, mby2)) {
    	draw_rectangle(mbx1, mby1, mbx2, mby2, false);
        draw_set_colour(c_black);
        draw_text(mbstr_x, mbstr_y, mbstr);
        if (mouse_check_button_pressed(mb_left)) {
        	audio_play_sound(bp_select, 0, false);
            add_rev = 0;
            add_sho = 0;
            add_rif = 0;
            if (mode == "take") {
            	mode = "give";
            } else {
                mode = "take";
            }
        }
    } else {
        draw_set_colour(c_red);
        draw_rectangle(mbx1, mby1, mbx2, mby2, true);
        draw_text(mbstr_x, mbstr_y, mbstr);
    }
    
    //act button
    
    var abx1 = gui_x + 260;
    var aby1 = mby1 + 35;
    var abx2 = abx1 + 35;
    var aby2 = aby1 + 22;
    
    var abstr = "Take";
    
    if (mode == "give") {
    	abstr = "Add";
        if (add_rev > 0 || add_sho > 0 || add_rif > 0) {
            var new_weight = obj_backpack.weight - (add_rev + add_sho + (add_rif * obj_backpack.rif_ammo_weight));
            
            var str = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight);
            
            draw_set_colour(c_red);
            draw_text(abx1 - 90, aby2 + 10, str);
        }
    } else {
        if (add_rev > 0 || add_sho > 0 || add_rif > 0) {
            var new_weight = obj_backpack.weight + (add_rev + add_sho + (add_rif * obj_backpack.rif_ammo_weight));
            
            var str = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight);
            
            draw_set_colour(c_red);
            draw_text(abx1 - 90, aby2 + 10, str);
        }
    }
    
    var abstr_x = abx1 + 3;
    var abstr_y = aby1;
    
    if (point_in_rectangle(mguix, mguiy, abx1, aby1, abx2, aby2)) {
    	draw_rectangle(abx1, aby1, abx2, aby2, false);
        draw_set_colour(c_black);
        draw_text(abstr_x, abstr_y, abstr);
        if (mouse_check_button_pressed(mb_left)) {
        	i_found_diamonds();
        }
    } else {
        draw_set_colour(c_red);
        draw_rectangle(abx1, aby1, abx2, aby2, true);
        draw_text(abstr_x, abstr_y, abstr);
    }
    
    //transfer button
    
    var tbx1 = gui_x + 5;
    var tby1 = rify + spc + 5;
    var tbx2 = tbx1 + 90;
    var tby2 = tby1 + 22;
    
    var tbstr = "Pocket Ammo";
    
    var tbstr_x = tbx1 + 3;
    var tbstr_y = tby1;
    
    if (point_in_rectangle(mguix, mguiy, tbx1, tby1, tbx2, tby2)) {
    	draw_rectangle(tbx1, tby1, tbx2, tby2, false);
        draw_set_colour(c_black);
        draw_text(tbstr_x, tbstr_y, tbstr);
        if (mouse_check_button_pressed(mb_left)) {
        	transfer_to_pocket();
        }
    } else {
        draw_set_colour(c_red);
        draw_rectangle(tbx1, tby1, tbx2, tby2, true);
        draw_text(tbstr_x, tbstr_y, tbstr);
    }
}
    
    /*
     *  ⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠉⠉⠉⠋⠉⠉⠙⠛⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⠿⠋⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠻⣿⣿⣿⣿⣿
        ⣿⣿⡟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⢻⣿⣿⣿
        ⣿⠏⠄⠄⠄⠄⠄⠄⠄⠄⢀⣔⢤⣄⡀⠄⡄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿
        ⠏⠄⠄⠄⠄⠄⠄⠄⢀⣀⣨⣵⣿⣿⣿⣿⣧⣦⣤⣀⣿⣷⡐⠄⠄⠄⠄⠄⢿⣿
        ⠄⠄⠄⠄⠄⠄⠐⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠄⠄⠄⢚⣿
        ⣆⠄⠄⠄⠄⠄⠄⢻⣿⣿⣿⣿⡿⠛⠛⠛⠛⣿⢿⣿⣿⣿⡿⢟⣻⣄⣤⣮⡝⣿
        ⣿⠆⠄⠄⠄⠄⠄⠄⠄⠄⠉⠘⣿⡗⡕⣋⢉⣩⣽⣬⣭⣶⣿⣿⣿⣿⣝⣻⣷⣿
        ⣿⣦⡀⠄⠄⠠⢀⠄⠄⠁⠄⠄⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿
        ⣿⣿⣿⡆⠄⠄⠰⣶⡗⠄⠄⠄⣿⣿⣿⣿⣦⣌⠙⠿⣿⣿⣿⣿⣿⣿⣿⡛⠱⢿
        ⣿⣿⣿⣿⡀⠄⠄⠿⣿⠄⠄⠄⠨⡿⠿⠿⣿⣟⣿⣯⣹⣿⣿⣿⣿⣿⣿⣿⣦⡀
        ⣿⣿⣿⣿⣷⠄⠄⠄⢷⣦⠄⠄⠐⢶⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
        ⣿⣿⣿⣿⣿⣧⡄⠄⠄⠉⠄⠄⠄⢉⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄
        ⣿⣿⣿⣿⣿⠟⠋⠄⠄⠄⠄⠄⠄⠈⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠄⠄
        ⣿⠿⠛⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠿⢿⣿⣿⣿⣿⣿⠿⠋⠄⠄⠄⠄
    }
     * */
    
    

/*
 * do you ever wonder what the fuck is going through the minds of terrible people?
 * 
 * i mean i feel like im a bad person, but not a terrible person, like a murderer.
 * 
 * i heard about that oregon school shooting, i think it was oregon at least
 * 
 * 16 year old killed 3 little kids and a teacher, then got gunned down by some dude
 * 
 * like what was that kid thinking? i can't wrap my mind around the rage of that kid
 * 
 * how can you be so mad?
 * 
 * i don't even feel hate
 * 
 * i just feel sad
 * 
 * the things i have done, i don't know why i did them
 * 
 * i knew it was wrong
 * 
 * but for some reason, it doesn't feel like i noticed it was wronged, or even fucking cared
 * 
 * why didn't i care?
 * 
 * is it like that for these evil people?
 * 
 * there's so many even younger people that shoot schools and stuff like that
 * 
 * and there's kids the same age that are the most innocent child you'll ever meet and they know nothing
 * 
 * why are some kids like that, but some end up as these school shooters?
 * 
 * and i feel like it's wrong to say i wish i was one of those innocent kids
 * 
 * because everything is my fault
 * 
 * but i do wish i could be innocent
 * 
 * i wish i had never bullied anyone or done so much weird things
 * 
 * and it feels selfish
 * 
 * sometimes it feels like all that stuff i did wasn't even a choice that I made
 * 
 * it feels like it just happened
 * 
 * i can't believe that i did it
 * 
 * like i really can't believe it
 * 
 * but i know i did
 * 
 * i just don't know why.
 * 
 * i wonder what the fuck it's like for a school shooter in the moment.
 * 
 * like how does that feel?
 * 
 * are they enjoying it or are they regretting it more with every passing second?
 * 
 * for sure they regret it afterward if they are caught, whether they are remorseful or not
 * 
 * is it pleasurable to them?
 * 
 * shooting their peers?
 * 
 * i guess i can see why it might be for some.
 * 
 * i used to know what it was like not caring about being a good person
 * 
 * but on that level?
 * 
 * and it makes sense if they have ASPD, but some don't even have that
 * 
 * they still have a little empathy
 * 
 * i especially dont understand the ones that dont end it afterward
 * 
 * like you knew that you were going to have to spend the rest of your miserable life in prison trapped in your miserable mind
 * 
 * i wish everyone could have at least decent morals
 * 
 * i do believe on some level morals is a luck thing
 * 
 * environmentally and biologically
 * 
 * can you change a future school shooter to become better before it's too late?
 * 
 * and while i like the answer yes, and i like to believe it
 * 
 * i feel like that is just as depressing if not more than if the answer were no
 * */