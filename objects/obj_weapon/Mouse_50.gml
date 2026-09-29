if !instance_exists(obj_player) or !obj_player.can_move or obj_player.being_attacked or global.pause exit;
    
rif_shoot_delay -= 1;

if weapon_type = 4 and obj_player.stamina > 0{
    if ham_charge < ham_max_charge{
        ham_charge += ham_charge_speed;
    }
    
    if ham_charge_up_sound_delay <= 0 and ham_charge < ham_max_charge{
        audio_play_sound(ham_charge_up, 0, false);
        ham_charge_up_sound_delay = ham_charge_up_sound_delay_max
    }
    ham_charge_up_sound_delay -= 1;
    
    var enemies = [];
    if (instance_exists(obj_window)) {
        with (obj_window) {
        	if (!broken) {
            	array_push(enemies, id);
            }
        }
    }
    if (instance_exists(obj_zombie_parent) and !position_meeting(mouse_x, mouse_y, obj_window)) {
        array_push(enemies, obj_zombie_parent);
    }
    var targets_list = ds_list_create();
    var circle_size = 20;
    if collision_circle(mouse_x, mouse_y, circle_size, enemies, true, true){
        collision_circle_list(mouse_x, mouse_y, circle_size, enemies, true, true, targets_list, true);
        ham_target = ds_list_find_value(targets_list, 0);
        var ham_target_distance = point_distance(obj_player.x, obj_player.y, ham_target.x, ham_target.y);
        var ham_target_distance_max = 50;
        var tilemap = layer_tilemap_get_id("obstacles");
        if ham_target_distance <= ham_target_distance_max and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, global.closed_obstacles, false, true) or (position_meeting(mouse_x, mouse_y, obj_window) and ham_target_distance <= ham_target_distance_max) {
            ham_target_in_range = true;
            ham_draw_target = true;
            
        }
        else{
            ham_target_in_range = false;
            ham_draw_target = false;
        }
    }
    else{
        ham_target_in_range = false;
        ham_draw_target = false;
    }
}

/* i'm going too hide in the 51st line of the global left down event here...
 * 
 * if you find this you now know that i am a gay furry even though a certain someone keeps calling me a larper
 * 
 * you know who you are and you hurt my feelings
 * 
 * while i may not have a fursuit i have a fursona and that's good enough butthead
 * 
 * his name is harry edwin
 * 
 * is he the same harry edwin as the protagonist of the other game?
 * 
 * yes and no.
 * 
 * he's a black cat like one of my real cat friends, i like black cats
 * 
 * maybe his name is harry edwin because i am harry edwin
 * 
 * wow
 * 
 * i'm sad
 * 
 * i feel like i will never find any love
 * 
 * and perhaps that's a good thing because i don't feel i deserve anyone's love
 * 
 * im not a good person, i've done evil things like cyberbullying
 * 
 * and to add fuel to the fire i am a weirdo, both in looks and how i have acted previously
 * 
 * and no one will ever know this comment existed, because i'm not toby fox
 * 
 * i'm gonna be a homeless bum with no future
 * 
 * why am i even making this game
 * 
 * maybe it is a comfort thing
 * 
 * maybe i really thing i have what it takes to make the next decent zombie game
 * 
 * maybe i just want another reason to make music
 * 
 * maybe it's because this code is predictable and it does only what i tell it to
 * 
 * im no supergenius this is a gamemaker game
 * 
 * my grandma could do this
 * 
 * one day i want to make a strategy game, like command and conquer, 2d of course i hate 3d
 * 
 * something like that, but with the lore deepness of hearts of iron
 * 
 * and it would generate history like dwarf fortress
 * 
 * but unlike hoi4 i want the game to be instantly playable
 * 
 * you can just open the game and within 5 minutes you know exactly ho to play
 * 
 * that's my philopsophy, and it's not original
 * 
 * i don't even know how to play hoi4
 * 
 * i can't enjoy it
 * 
 * and i feel bad because my friend gifted it to me because they thought i'd like it
 * 
 * and i've decided to stop talking to that friend because i think they do not want to talk to me anymore due to reasons that are entirely my fault
 * 
 * sometimes i wish i could just snap my finger and all my friends and the people who talk to me would go away
 * 
 * and i wouldn't have to bear the annoyance of useless small talk
 * 
 * or i could just be left alone
 * 
 * or so that i can't hurt anyone else
 * 
 * being around me must be risky
 * 
 * i might drag you down because i'm a negative nancy
 * 
 * i don't think i'll ever amount to anything or even be able to get a house
 * 
 * i'm just bad at life
 * 
 * and i don't even care
 * 
 * i'm failing nearly all my classes and it doesn't matter to me one bit
 * 
 * all that matters is this stupid game that isn't even my best idea
 * 
 * i fear i will never even start on my best idea
 * 
 * but i want to at least bring this to life
 * 
 * at least
 * 
 * and to be honest...
 * 
 * i'm probably just lazy
 * 
 * using ai on assignments feels like too much work
 * 
 * i certainly am going to kill myself, either intentionally or unintentionally before i can legally drink
 * 
 * but before that happens, this game needs to come out, whether anyone will play it or not
 * 
 * i'm going to cut myself again
 * 
 * certainly i have done it over a hundred times
 * 
 * i've done it several times a month since the last quarter of eighth grade, all through the summer and up until now in freshman year
 * 
 * occasionally i have cut so deep i have seen fat, and the scars for those don't ever go away from what i've seen
 * 
 * once, i was really upset and ran into my bedroom (which was my grandpa's when he was alive) at my mom and grandma's house, locked the door, and cut my wrist really hard
 * 
 * then i saw the fat, and it started bleeding
 * 
 * my heart sank, i started hyper ventilating (i think)
 * 
 * i paced for a while, and then i calmed down
 * 
 * it was bleeding quite a bit
 * 
 * it was stupid but in the moment i actually kind of thought that that one would finally be the one to kill me,
 * 
 * so i layed down on the bed and put in my headphones and listened to mozart's (with the help of sussmayr i guess since mozart died halfway through) requiem in d minor
 * 
 * it's my favorite
 * 
 * by the time the communio (the final movement) had finished, i was still laying there, alive
 * 
 * the blood was all dried
 * 
 * honestly don't know how i thought that was gonna kill me
 * 
 * i guess it might've if my aim had been a little better
 * 
 * i got some on my hoodie, which stayed dried on there for several weeks
 * 
 * this was like the first or second day of school, so probably a few weeks ago
 * 
 * eventually my dad found out because of my mom (supposedly; kind of hard to tell if he was lying that she saw them)
 * 
 * i have no idea how she had seen them if it was her
 * 
 * maybe one of my friends had tipped her about it
 * 
 * earlier i had to go to iu to play music in the stadium with the iu drumline
 * 
 * i did cymbals
 * 
 * i hate band
 * 
 * i was forced to wear shorts, and they didn't cover my thighs good enough
 * 
 * when my friend(s) saw they wouldn't leave me alone
 * 
 * and now one of them keeps bringing it up even though i've told them to stop talking about it
 * 
 * and it's not like "are you ok" it's like a joke
 * 
 * not like mean
 * 
 * just irritating
 * 
 * and at iu they wouldn't keep their voice down, so maybe others heard
 * 
 * i think only one person saw the ones on my arm
 * 
 * the night before, i had absolutely shredded my arm because i was really upset to go to the band trip, and it felt like a wreckless final act
 * 
 * but only one person saw it, i think
 * 
 * we was getting ready to go onto the field, i was told i couldn't wear my hoodie, so i tried to cover my arm with the cymbals
 * 
 * but i saw the person look at it under the cymbals, and back at me
 * 
 * i don't recall it well so many it was nothing
 * 
 * they said nothing about it, but that's expected because they are that kind of person
 * 
 * and i respect it
 * 
 * and this certainly isn't unique to me or honestly anything crazy
 * 
 * statiscally this has to be pretty common
 * 
 * so i'll keep doing it because it feels good, and i haven't died (obviously) or even gotten in infection despite doing it with dirty knives in dirty areas
 * 
 * and i definitely deserve whatever pain i experience from it
 * 
 * other friends have said that i'm lying when i say it feels good and that it just hurts and does nothing else
 * 
 * but maybe it feels good to me because it feels like justice
 * 
 * or more realistically it's the relaxing chemicals that the brain releases after a minute when you get a booboo
 * 
 * writing this stuff down helps me understand things more clearly
 * 
 * and what better place to do it than in a random script of this shitty game no one will ever play, let alone look in the source code
 * 
 * ha!
 * 
 * sorry, here's the rest of the code
 * */
    
if weapon_type = 3 and rif_can_shoot = true and rif_shoot_delay <= 0 and fire_mode = 0{
    rif_shoot_delay = rif_shoot_delay_max;
    draw_a_bullet = true;
    var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
    var tilemap = layer_tilemap_get_id("obstacles");
    var targets = [tilemap, obj_zombie_parent];
    if instance_exists(obj_door){
        with (obj_door) {
        	if (open == false) {
                array_push(targets, id);
            }
        }
    }
    var start_x = obj_player.x;
    var start_y = obj_player.y;
    var checker_x = start_x;
    var checker_y = start_y;
    var point_x = mouse_x;
    var point_y = mouse_y;
    var dir = point_direction(start_x, start_y, point_x, point_y);
    var max_distance = point_distance(start_x, start_y, point_x, point_y);
    
    var step_x = lengthdir_x(1, dir);
    var step_y = lengthdir_y(1, dir);
    
    while (position_meeting(checker_x, checker_y, targets) == 0 and point_distance(start_x, start_y, checker_x, checker_y) < max_distance) {
    	checker_x += step_x;
        checker_y += step_y;
        if position_meeting(checker_x, checker_y, obj_window){
            var window_to_shoot = instance_nearest(checker_x, checker_y, obj_window);
            if (!window_to_shoot.broken) {
                window_to_shoot.broken = true;
            }
        }
    }
    
    var end_x = checker_x;
    var end_y = checker_y;
    
    if position_meeting(end_x, end_y, obj_zombie_parent){
        var zombie_to_shoot = instance_nearest(end_x, end_y, obj_zombie_parent);
        deal_damage(rif_damage, sound_to_play, zombie_to_shoot);
    }
    if position_meeting(mouse_x, mouse_y, obj_player){
        obj_player.infected = false;
        deal_damage(1000, sound_to_play, obj_player);
    }
    
    rif_bullets_left -= 1;
    audio_play_sound(rif_gunshot1, 0, false);
    
    if instance_exists(obj_zombie_parent){
        obj_zombie_parent.target_x = obj_player.x;
        obj_zombie_parent.target_y = obj_player.y;
        obj_zombie_parent.search_zone_w = [obj_zombie_parent.target_x - 60, obj_zombie_parent.target_x + 60];
        obj_zombie_parent.search_zone_h = [obj_zombie_parent.target_y - 60, obj_zombie_parent.target_y + 60];
        obj_zombie_parent.chase_player = true;
        obj_zombie_parent.interest = obj_zombie_parent.max_interest;
    }
}