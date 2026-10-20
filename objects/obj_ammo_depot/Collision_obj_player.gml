if !instance_exists(obj_player) exit;
if keyboard_check_pressed(ord("E")) and obj_player.can_move = true{
    audio_play_sound(resupply, 0, false);
    if rev_ammo > 0 and obj_weapon.rev_total_bullets < obj_weapon.rev_max_total_bullets or obj_weapon.rev_bullets_left < obj_weapon.rev_max_bullets{
        var rev_total_bullets_to_add = obj_weapon.rev_max_total_bullets - obj_weapon.rev_total_bullets;
        var rev_bullets_to_add = obj_weapon.rev_max_bullets - obj_weapon.rev_bullets_left;
        
        obj_weapon.rev_total_bullets += rev_total_bullets_to_add + rev_bullets_to_add;
        rev_ammo -= rev_total_bullets_to_add + rev_bullets_to_add;
    }
    if sho_ammo > 0 and obj_weapon.sho_total_bullets_left < obj_weapon.sho_max_total_bullets or obj_weapon.sho_bullets_left < obj_weapon.sho_max_bullets{
        var sho_total_bullets_to_add = obj_weapon.sho_max_total_bullets - obj_weapon.sho_total_bullets_left;
        var sho_bullets_to_add = obj_weapon.sho_max_bullets - obj_weapon.sho_bullets_left;
        
        obj_weapon.sho_total_bullets_left += sho_total_bullets_to_add + sho_bullets_to_add;
        sho_ammo -= sho_total_bullets_to_add + sho_bullets_to_add;
    }
    if rif_ammo > 0 and obj_weapon.rif_total_mags < obj_weapon.rif_max_total_mags or obj_weapon.rif_bullets_left < obj_weapon.rif_max_bullets{
        var rif_total_mags_to_add = obj_weapon.rif_max_total_mags - obj_weapon.rif_total_mags;
        
        obj_weapon.rif_total_mags += rif_total_mags_to_add;
        rif_ammo -= rif_total_mags_to_add;
        if obj_weapon.rif_bullets_left <= 0{
            obj_weapon.rif_bullets_left = obj_weapon.rif_max_bullets;
            rif_ammo -= 1;
        }
    }
} /*
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