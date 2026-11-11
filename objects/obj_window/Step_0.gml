if (boards and hp <= ahp) {
    if (broken) {
        image_index = 2;
        var index3 = array_get_index(global.opaque_obstacles, id);
        array_delete(global.opaque_obstacles, index3, 1);
        var index1 = array_get_index(global.closed_obstacles, id);
        var index2 = array_get_index(global.breakable_obstacles, id);
        array_delete(global.closed_obstacles, index1, 1);
        array_delete(global.breakable_obstacles, index2, 1);
    }
    else{
        var index3 = array_get_index(global.opaque_obstacles, id);
        array_delete(global.opaque_obstacles, index3, 1);
        image_index = 0;
    }
    reset = false;
    var sound_to_play = doorbreak1;
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
    boards = false;
    given_board_hp = false;
    if (bhptgb > 0) {
        bhptgb = 0;
    }
}

if hp <= 0 and !broken{
    image_index = 2;
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    var sound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 480, 1, false, 0);
    broken = true;
}

if keyboard_check(vk_space){
    if instance_exists(obj_player) and obj_player.can_move = true{
        var dfw = point_distance(obj_player.x, obj_player.y, cx, cy);
        
        if dfw <= 32 and reset and !obj_player.being_attacked{
            var sd = 10; //sound delay
            if (boards) {
            	hp -= 1;
                bhptgb += 1;
                if (hp % sd == 0) {
                    audio_play_sound(ham_charge_up, 0, false);
                }
            }
            else{
                if (board_delay > 0) {
                	board_delay -= 1;
                    if (board_delay % sd == 0) {
                        audio_play_sound(ham_charge_up, 0, false);
                    }
                }
                else{
                    array_push(global.opaque_obstacles, id);
                    if (broken) {
                        image_index = 3;
                    }
                    else{
                        image_index = 1;
                    }
                    reset = false;
                    boards = true;
                    audio_play_sound_at(boardbuilt1, x, y, 0, 160, 320, 1, false, 0);
                    board_delay = board_delay_max;
                    ahp = hp;
                    hp += 50;
                    array_push(global.closed_obstacles, id);
                    array_push(global.breakable_obstacles, id);
                }
            }
        }
    }
}
else {
    board_delay = board_delay_max;
    hp += bhptgb;
    bhptgb = 0;
	reset = true;
}

/*
 * 
 * im upset right now so i want to write in here.
 * 
 * couldn't really tell you why exactly
 * 
 * cuz idk that
 * 
 * but it's something about the things i have done and the things i have not done again
 * 
 * and the things that have happened and have not happened
 * 
 * i almost fell asleep to mozart's requiem but i got the urge to go on reddit
 * 
 * and im gonna be honest i haven't used reddit for anything other than watching gore
 * 
 * i swear im not trying to be edgy
 * 
 * and i only watch gore when im really upset
 * 
 * i like to watch people kill themselves so i can see
 * 
 * what it might look like when i make my attempt
 * 
 * and im gonna be honest i get sad seeing that
 * 
 * so i can only imagine
 * 
 * what it would like like to someone who knew them
 * 
 * so i feel like i will only do it when people have lost interest in me
 * 
 * hmmm
 * hm'
 * 
 * some time ago i had wanted to write a death mass (requiem) so that i could kill myself
 * 
 * but i suck
 * 
 * whenever i make music i make something pretty good, but it's never what i wanted it to be when i started
 * 
 * i drew some sprites today
 * 
 * i was gonna give my self proclaimed artist friend some money to do it but they had nothing in like 2 days so i
 * 
 * went ahead and did it myself, which took 40 minutes or less
 * 
 * so i guess it's best if i just do things myself
 * 
 * one of my
 * 
 * other friends would have used it as an excuse to not do anything
 * 
 * they always do that
 * 
 * whenever we would vibecode roblox games he would refuse to model anything (they were the modeler)
 * 
 * because they wanted to wait until this one friend had finished vibecoding a system that barely had anything to 
 * 
 * do with
 * 
 * the models
 * 
 * i shouldn't feel like this
 * 
 * but i hope when they see me
 * 
 * make any progress with this game
 * 
 * they get jealous
 * 
 * but i shouldn't think that because
 * 
 * i am lazy too, just
 * 
 * less lazy as this
 * 
 * but they are kind of an asshole
 * 
 * but i guess i can't be talking there either
 * 
 * i saw a video of a russian soldier with his back blown up by something
 * 
 * and his spine was like out
 * 
 * and he was on fire
 * 
 * and he was trying to put it out
 * 
 * that's that first gore video that almost made me cry
 * 
 * usually i just look at it and feel hopeless and upset
 * 
 * but that just made me sad
 * 
 * and i want to cut myself right now
 * 
 * but i don't want to have to sneak a knife over here when i could easily get
 * 
 * caught
 * 
 * i do not want to be caught again
 * 
 * because then 
 * 
 * it
 * 
 * will get pretty bad 
 * 
 * mmmmm
 * 
 * and i should be sleeping because i have to be doing stuff for band until like really late at night tomorrow
 * 
 * and im upset about that too
 * 
 * because i wont be able to piss all day
 * 
 * i have really bad shy bladder
 * 
 * if it's not a bathroom im familiar with, then i can't piss
 * 
 * and i've tried so many times to just get over it, but i end up just standing there for 4 minutes with my dick in my
 * 
 * hand
 * 
 * trying to piss while it feels like everybody is noticing
 * 
 * how long i am taking
 * 
 * so instead i have just gotten really good at managing how much i drink (
 * 
 * not at home of course, i drink so much soda i piss every 5 mintues)
 * 
 * but on big events like tomorrow
 * 
 * but its worrying because what if i accidentally drink too much?
 * 
 * tomorrow is monday
 * 
 * oh
 * 
 * and
 * 
 * i got a 140 dollar monitor so that i can bring my pc over to my moms house
 * 
 * so i wont have to share pcs with my brother
 * 
 * and i can do more work on jj!
 * 
 * anyways
 * 
 * tomorrow is monday
 * 
 * and so starting tuesday
 * 
 * i want to do some more work in here
 * 
 * my next goals are to set up the days system,
 * 
 * and a template for bossfights
 * 
 * and then once i have a better idea on how all this is going to work,
 * 
 * i will get right back to survivor npcs
 * 
 * i think after the bossfight template,
 * 
 * i will try and do a little c++ experiment
 * 
 * i'm gonna try and write my own pathfinding like i did in js
 * 
 * and i'm gonna see how many pathfinding little guys i can get at once
 * 
 * so i can see if my rts idea is even possible
 * 
 * so i hope that goes well
 * 
 * ooh yeah
 * 
 * before i start back up on survivor npcs
 * 
 * i need to rework the looting system
 * 
 * it's just not gonna hold for much longer
 * 
 * and trying to fix it is just gonna be a nightmare
 * 
 * so i'll just make a new one
 * 
 * can't be that hard
 * 
 * y know maybe i work so slow here because this isn't fun
 * 
 * or maybe i need to just get better at starting
 * 
 * because usually when i force myself to do it i get it done
 * 
 * but
 * 
 * i wish coding this was more enjoyable
 * 
 * it's like talking about playing minecraft versus playing minecraft
 * 
 * and i am really surprised i have come this far
 * 
 * i have a pretty good idea of how im going to structure these systems
 * 
 * i think about it a lot
 * 
 * but sometimes it's hard to come up with a solution
 * 
 * like im really thinking hard about how npc squads are gonna work
 * 
 * so i decided maybe if i work on the actual game and map and stuff, i'll get a better idea
 * 
 * but there is one thing that's holding me back it seems like
 * 
 * my friends
 * 
 * not like that
 * 
 * but it's difficult for me to say no when they ask to play video games
 * 
 * because once i start playing with them i can't stop
 * 
 * and the days i have been most productive
 * 
 * i have been the most lonely
 * 
 * and i
 * 
 * feel like a lot of people would tell me to just be a kid
 * 
 * but i don't feel like i have a lot of time left on earth
 * 
 * and school is making me sad
 * 
 * i want to cry
 * 
 * but i can't
 * 
 * can't remember the last time i cried
 * 
 * it was probably beginning of school year when i cut my self on the wrist, saw a little fat
 * 
 * and layed down belly up in my dead papaw's bed listening to the entirety of mozart's requiem
 * 
 * like it was a 10/10 bleed out spot
 * 
 * but i want to cry again
 * 
 * because it feels good
 * 
 * but it doesn't feel like there's anything to cry about
 * 
 * i can only just try to comprehend things
 * 
 * but what things?
 * 
 * what about my life is so bad?
 * 
 * there are so many people whose lives are far worse than mine
 * 
 * and i couldn't even tell you anything about my life that sucks that isn't my fault
 * 
 * so what is it
 * 
 * is that what im comprehending
 * 
 * what that thing is im worried about is
 * 
 * is it time?
 * 
 * is it because i probably am only gonna live for like 6 more years?
 * 
 * is it the fact that i am lazy
 * 
 * and don't work on these projects as much as i am supposed to
 * 
 * or is it something else
 * 
 * like how lonely i feel
 * 
 * i have great friends
 * 
 * but the romantically lonely is what i feel
 * 
 * and it's probably my fault for not being with anyone too
 * 
 * i wonder how much space these comments take up
 * 
 * am i upset right now because i am not cutting myself
 * 
 * i mean honestly i dont wanna deal with that pain tomorrow
 * 
 * so
 * 
 * im running out of things to write about
 * 
 * but i am still upset
 * 
 * i can't sleep
 * 
 * i mean maybe ill just try
 * 
 * i wanna be remembered
 * 
 * 
 * but i don't feel worthy
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 