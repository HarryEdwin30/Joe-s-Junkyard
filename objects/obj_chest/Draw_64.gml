if draw_gui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    if chest_empty = true{
        draw_text(110, 150, "Chest --- This chest is empty.");
    }
    else{
        draw_text(110, 150, "Chest --- Be careful what you take! You won't be able to return it.");
    }
    
    var bp_text_x = 320;
    if bs > 0{
        draw_text(110, 190, "Beef Stew: " + string(bs));
        draw_text(bp_text_x, 190, "BP: " + string(obj_backpack.bs));
    }
    
    if scrap > 0{
        draw_text(110, 215, "Scrap: " + string(scrap));
        draw_text(bp_text_x, 215, "BP: " + string(obj_backpack.scrap));
    }
    
    if rev_ammo > 0{
        draw_text(110, 240, "Revolver Ammo: " + string(rev_ammo));
        draw_text(bp_text_x, 240, "BP: " + string(obj_backpack.rev_ammo));
    }
        
    if sho_ammo > 0{
        draw_text(110, 265, "Shotgun Ammo: " + string(sho_ammo));
        draw_text(bp_text_x, 265, "BP: " + string(obj_backpack.sho_ammo));
    }
        
    if rif_ammo > 0{
        draw_text(110, 290, "Rifle Ammo: " + string(rif_ammo));
        draw_text(bp_text_x, 290, "BP: " + string(obj_backpack.rif_ammo));
    }
        
    if zev_cakes > 0{
        draw_text(110, 315, "Zev Cakes: " + string(zev_cakes));
        draw_text(bp_text_x, 315, "BP: " + string(obj_backpack.zev_cakes));
    }
        
    //this code down here is just a copy paste from the backpack
    var dbutton_size = 16;
    
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
    
    var bs_dbutton_f = 0;
    var scrap_dbutton_f = 0;
    var rev_ammo_dbutton_f = 0;
    var sho_ammo_dbutton_f = 0;
    var rif_ammo_dbutton_f = 0;
    var zev_cake_dbutton_f = 0;
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{
        if mouse_gui_y >= bs_dbutton_y1 && mouse_gui_y <= bs_dbutton_y2{ // beef stew
            bs_dbutton_f = 1;
        }
        
        if mouse_gui_y >= scrap_dbutton_y1 && mouse_gui_y <= scrap_dbutton_y2{ // scrap
            scrap_dbutton_f = 1;
        }
        
        if mouse_gui_y >= rev_ammo_dbutton_y1 && mouse_gui_y <= rev_ammo_dbutton_y2{ // rev_ammo
            rev_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= sho_ammo_dbutton_y1 && mouse_gui_y <= sho_ammo_dbutton_y2{ // sho ammo
            sho_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= rif_ammo_dbutton_y1 && mouse_gui_y <= rif_ammo_dbutton_y2{ // rif ammo
            rif_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= zev_cake_dbutton_y1 && mouse_gui_y <= zev_cake_dbutton_y2{ // zev cakes
            zev_cake_dbutton_f = 1;
        }
    }
    
    /*
     * when i kill myself my soul is going to haunt this game
     * 
     * this could totally be like an arg, but a real one
     * 
     * especially if i die while this game is still in it's premature stages
     * 
     * spooky
     * 
     * you know this probably is just gonna be a thing now
     * 
     * i feel like this is the only place i can write down my thoughts without risking someone finding out
     * 
     * unless some nerd wants to look in the source code of this game
     * 
     * but if it ever gets somewhat popular im deleting these comments unless i forget
     * 
     * it's weird when i make music
     * 
     * sometimes i just sit down and cook
     * 
     * and other times, i have to throw away everything i made because it just sounds corny
     * 
     * but most of the time composing is spent on the first phrase, and then i build from there
     * 
     * maybe that's why my music is so short and repetitive
     * 
     * i'm trying to build something great out of one theme
     * 
     * but also maybe i'm just doing it wrong?
     * 
     * idk
     * 
     * i wish i could do it as (seemingly) effortlessly as mozart
     * 
     * and he had paper and pencil, and i have a computer
     * 
     * it's inhuman how good he was, really
     * 
     * i'm trying to make my next piece something special
     * 
     * something a little more classical
     * 
     * most of the stuff i have made has at least met my own taste
     * 
     * yeah i probably shouldn't worry too much about my musical skills fading
     * 
     * i listen to my own music, because i like it
     * 
     * it doesn't even feel like i wrote it
     * 
     * they feel like accidents
     * 
     * i mean they aren't perfect
     * 
     * but at least to me they sound good
     * 
     * still failing school
     * 
     * my mom still hates me for it
     * 
     * still don't plan to try in school
     * 
     * i just wanna finish this game so i can kill myself
     * 
     * i hope i won't chicken out on suicide because i feel like a fraud
     * 
     * and i don't want to be one of those people that say they're gonna end it but are too scared to
     * 
     * there's a kid in my grade that does that
     * 
     * i mean i don't blame him it's probably just a weird habit
     * 
     * he does something wrong or gets upset and just yells that he's gonna blow his brains out and/or smacks himself in the head
     * 
     * he never gets sent to the counselor, i don't think
     * 
     * it just happens so much that everyone's come to the conclusion that he is not a threat to himself
     * 
     * and he's also jolly as a jelly bean 9 times outta 10 so yeah
     * 
     * i fucking hate trying to optimize this game
     * 
     * it's not even the zombies
     * 
     * it's these stupid fucking doors, windows, chests, and maybe something else
     * 
     * they rape my fps
     * 
     * i tried to play on one of the computers in the computer lab at school, and i could barely spawn a hundred zombies or it would dip below 60 fps
     * 
     * i really don't want this game to ever dip below 60 on even the shittiest systems
     * 
     * i want everyone to be able to play
     * 
     * i'm worried heavily about how laggy the survivors will be
     * 
     * not necessarily their visible ai but how i plan to keep track of them all
     * 
     * well i'll figure something out
     * 
     * can't be that bad
     * 
     * i think probably the next thing i'll do is try to optimize the hell out of the chests, doors, windows, etc
     * 
     * they get rid of about 3000 fps
     * 
     * and imagine how much they'd steal in the final map, which will be much bigger than this pre alpha one
     * 
     * i don't really know if i'm an asshole or not
     * 
     * i feel like such an asshole to my mom and grandma
     * 
     * but not so much to my friends and brother
     * 
     * maybe i am to everyone
     * 
     * and i just don't know it
     * 
     * i have a feeling that i leave a bad taste in everyone's mouth
     * 
     * i wouldn't be surprised if i do
     * 
     * if anyone ever sees this just know that all my problems really are 100% my fault
     * 
     * and i swear on this game that i'm not pity farming when i say that
     * 
     * if this game ever gets me a following, i might not kill myself
     * 
     * and if i don't, i have some things to say
     * 
     * about what i have done
     * 
     * not necessarily apologize or try to get rid of my guilt
     * 
     * but i feel like what i have to say could prevent someone from being a person like me
     * 
     * because i don't wanna be me
     * 
     * and i don't want anyone else to be anything like me
     * 
     * i do believe i am better in a way now
     * 
     * i'm not cyberbullying anymore, for example. there are many bad things i did and that's the worst of it
     * 
     * i could've caused them to end it all
     * 
     * but they were a very strong person
     * 
     * stronger and better than i'll EVER be for sure
     * 
     * i'm hoping the people that thought i was justified in bullying them or that it was funny are not bullying him still
     * 
     * and if they are i really don't know, but it wouldn't be possible without me so i don't blame them if they do
     * 
     * but i want to try and stop it if i can
     * 
     * i'm having thoughts that aren't describable
     * 
     * imagine nostalgia, a sense of finality, guilt, shame, and a sense of justice and injustice all combined into one thought
     * 
     * but that's just a vague description
     * 
     * i feel like all i can do is let the wind carry me
     * 
     * to hell if im gonna do my fucking homework
     * 
     * every day i care less and less about school
     * 
     * i only do the assignment if it genuinely requires 0 brainpower
     * 
     * i think i've only done a single geometry assignment
     * 
     * idrc about passinf geometry this year anyway because it's advanced for my grade
     * 
     * (i was a fucking nerd who thought i was better than everyone else because of my grades, until school actually got hard, so i got in advanced stuff)
     * 
     * imagine berdly from deltarune but with less confidence and very shy
     * 
     * i mean it didn't really hurt anyone but thinking about how corny i was keeps me up at night
     * 
     * i'm excited for the upcoming weeks
     * 
     * i sold my friend a pc for around 500 dollars
     * 
     * i'm gonna use the money to buy some birthday presents for my best friend
     * 
     * i'm getting them a little ralsei plushie and a kris sweater since they're non-binary (and they also just want it because they like sweaters)
     * 
     * and i'm going to get myself a black hoodie with the logo for this game printed on it because i would feel like an elite ball knowledge holder
     * 
     * and whatever i have left i might spend buying a shitty furry mask from spirit halloween
     * 
     * some of my friends were talking about getting furry stuff for halloween
     * 
     * i honestly couldn't tell if they was serious or not, but i hope they were because i've been looking for an excuse to get at least a mask
     * 
     * i think it'd be cool
     * 
     * i've been wanting to live stream the development of this game and music
     * 
     * but i can't seem to get the tiktoks popular
     * 
     * how do i catch people's attention better?
     * 
     * maybe i need to start showing clips of the game instead of just music snippets
     * 
     * or clipfarm
     * 
     * that'd be some embarrassing shit though if someone points it out
     * 
     * sometimes i genuinely have gotten joe bart level furious at this shit or the music
     * 
     * if i ever make this game payed, it would certainly be because i'd see that i could make a living off it
     * 
     * if it's free, i'm probably dead or dying, but at least everyone can play
     * 
     * all the pre-release versions would certainly be free
     * 
     * i'm definitely not gonna rush full release 1.0.0
     * 
     * i know when the game's done
     * 
     * and this won't be a forever game
     * 
     * i'll instantly move to the next thing if i want to keep going
     * 
     * i think the only updates that a game should get after 1.0 are patches
     * 
     * if you keep adding stuff it just gets feature bloated
     * 
     * that's why no one fucking plays fortnite anymore
     * 
     * because if you take a break for more than a week, you'll come back and everything's gotten 10x more complicated
     * 
     * honestly same with helldivers II
     * 
     * not as bad tho
     * 
     * im done yapping here's the rest of the code imma go cut myself
     * 
     * (peter griffin ascii art)
     * */
    
    if bs_tamount > 0 draw_text(dbutton_x2 + 5, bs_dbutton_y2 - 16, "+ " + string(bs_tamount));
        
    if scrap_tamount > 0 draw_text(dbutton_x2 + 5, scrap_dbutton_y2 - 16, "+ " + string(scrap_tamount));
        
    if rev_tamount > 0 draw_text(dbutton_x2 + 5, rev_ammo_dbutton_y2 - 16, "+ " + string(rev_tamount));
        
    if sho_tamount > 0 draw_text(dbutton_x2 + 5, sho_ammo_dbutton_y2 - 16, "+ " + string(sho_tamount));
        
    if rif_tamount > 0 draw_text(dbutton_x2 + 5, rif_ammo_dbutton_y2 - 16, "+ " + string(rif_tamount));
        
    if zc_tamount > 0 draw_text(dbutton_x2 + 5, zev_cake_dbutton_y2 - 16, "+ " + string(zc_tamount));
    
    //we're gonna draw the drop buttons down here
    if bs > 0 draw_sprite(spr_drop_button, bs_dbutton_f, dbutton_x1, bs_dbutton_y1); //beef
    if scrap > 0 draw_sprite(spr_drop_button, scrap_dbutton_f, dbutton_x1, scrap_dbutton_y1); //scrap
    if rev_ammo > 0 draw_sprite(spr_drop_button, rev_ammo_dbutton_f, dbutton_x1, rev_ammo_dbutton_y1); //rev ammo
    if sho_ammo > 0 draw_sprite(spr_drop_button, sho_ammo_dbutton_f, dbutton_x1, sho_ammo_dbutton_y1); //sho ammo
    if rif_ammo > 0 draw_sprite(spr_drop_button, rif_ammo_dbutton_f, dbutton_x1, rif_ammo_dbutton_y1); //rif ammo
    if zev_cakes > 0{
        draw_sprite(spr_drop_button, zev_cake_dbutton_f, dbutton_x1, zev_cake_dbutton_y1); //zev cakes
    }
    if draw_take_options = true{
        var take_f = 0;
        var cancel_f = 0;
        var take_c = c_red;
        var cancel_c = c_red;
        
        var take_y1 = obj_y + 50;
        var take_y2 = take_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_y >= take_y1 && mouse_gui_y <= take_y2{
                take_f = 1;
                take_c = c_black;
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                cancel_f = 1;
                cancel_c = c_black;
            }
        }
    
        draw_sprite(spr_backpack_button, take_f, obj_x, take_y1);
        draw_sprite(spr_backpack_button, cancel_f, obj_x, cancel_y1);
    
        draw_text_colour(obj_x + 52, take_y1 + 5, "Take", take_c, take_c, take_c, take_c, 1);
        draw_text_colour(obj_x + 44, cancel_y1 + 5, "Cancel", cancel_c, cancel_c, cancel_c, cancel_c, 1);
        var new_weight = obj_backpack.weight + ((bs_tamount * obj_backpack.bs_weight) + (scrap_tamount * obj_backpack.scrap_weight) + (rev_tamount) + (sho_tamount) + (rif_tamount * obj_backpack.rif_ammo_weight) + (zc_tamount * obj_backpack.zev_cake_weight))
        var nw_string = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight)
        if new_weight > obj_backpack.max_weight{
            nw_string = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight) + " !!!";
        }
        draw_text(obj_x, 290, nw_string);
    }
}