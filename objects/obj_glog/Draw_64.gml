/*
 * i just added survivor ai and the revolver for them
 * 
 * i'm actually really proud of myself for how far i've come with this game
 * i haven't abandoned it and i don't want to
 * 
 * i've learned so much about programming too
 * 
 * i have used ai, but i have used it to tutor me instead of just give me the code with no explaination
 * 
 * i understand how every nook and cranny of this game works
 * 
 * 100%, the fate of this game is not in the hands of ai
 * 
 * i can write code without ai
 * 
 * and ill say it again, i don't copy and paste
 * 
 * the only times i did copy and paste was with the pushing logic with zombies, some of the pathfinding, and other push logic
 * 
 * i did it because it seemed complicated and i wanted to just move on to adding some more fun stuff
 * 
 * and i felt guilty about not understanding the copied code, so i took a day or two to just ask the ai questions about how it works
 * 
 * now if i need to, i can write the code myself
 * 
 * if i have a bug in the code, i take about 5 to 10 minutes to see if i can find the problem myself
 * 
 * if i really can't find it, then i ask ai, and usually it's something stupid like a typo
 * 
 * and i usually don't copy and paste for debugging either
 * 
 * i probably shouldn't even feel that guilty about copy and pasting as long as the code works, i understand it, and if there's a bug io can fix it
 * 
 * i see ai as a tutor/teacher
 * 
 * there's no humans to teach me these things
 * 
 * i can't take any classes
 * 
 * and i don't watch youtube tutorials because i only want the information i need
 * 
 * every programmer needs google
 * 
 * and ai is just a better google (well it's google ai) because it just looks through a bunch of websites for you and gets the info you need
 * 
 * at school i've been doing a lot of stuff with html/css/js in onecompiler instead of my schoolwork
 * 
 * i'm really interested in pathfinding right now, so i've been trying to make a pathfinding engine in js at school
 * 
 * it's really not as complicated as i thought, though i wouldn't have been able to come up with the logic of the pathfinding equation from scratch
 * 
 * so far i think it's nearly done, i just need to clean some things up
 * 
 * i'm also curious about how proedual map generation works, so next i'll try to create an engine for that
 * 
 * earlier i did make a very simple 2d physics engine in js
 * 
 * i couldn't figure out how to get objects to bounce off eachother, but i did figure out how to get them to bounce off the canvas borders
 * 
 * anyway i feel like joe's junkyard is my main reason to be alive rn
 * 
 * if i wasn't doing any of this idk if i'd still be here
 * 
 * my whole life i've either been a weirdo, a bad person, or both, so from now on i want to try and be better
 * 
 * and all these things i'm doing with music and coding are making me better
 * 
 * and i don't hang out with bad kids that much anymore
 * 
 * when i was doing evil things i was hanging out with other bad kids
 * 
 * but now i have real, good friends who know how bad i have been but still accept me
 * 
 * and since i don't see myself becoming successful at life, i want a spiritual success
 * 
 * i may die as a hobo or something like that, but i will die leaving behind music and my coding projects
 * 
 * and that's my life goal
 * 
 * and it matters to me even though i do not believe in an afterlife
 * 
 * i've been getting like 2 hours of sleep each day for several days
 * 
 * today (well technically yesterday because it's 3 am rn but you know what i mean) i had to force myself to go to sleep after school even though i didn't want to because i'm sleep deprived
 * 
 * the night before that, there was a concert for band. i got the band director to give me a list of all the instruments we have cuz i wanted to do something
 * 
 * i got back at like 7, and i just orchestrated the Manitoba Flu until i was done at around 3-4 am
 * 
 * i think i actually did a decent job with that orchestration
 * 
 * there's also choral parts in there
 * 
 * the manitoba flu does have lyrics, but in this game it won't
 * 
 * i have done this multiple times, but we never actually performed any of my songs
 * 
 * but that's because they were either musically bad, unplayable for the players, or unprofesional
 * 
 * but this time, it's good music, it's playable, and the music should be written professionally or at least correctly
 * 
 * so today i gave the band director the conductor score and his response was promising
 * 
 * and i said that if he does use it i don't want him to tell anybody it's mine
 * 
 * in 7th and 8th grade i used to do a lot of solos and stuff, and at the end of 8th i did managed to get one of my songs to be at least attempted by the band
 * 
 * stuff like the caravan solo from whiplash, moonlight sonata 1st mvt, etc
 * 
 * i didn't get a lot of attention, but the attention i did get, i didn't really like
 * 
 * when random people would come up to me and say "that was cool" i panicked
 * 
 * anyway
 * 
 * they knew it was mine that time
 * 
 * i was proud of it at the time. of course now it's the worst thing i've ever heard in my fucking life. but at the time, i was proud and my ego was kind of high
 * 
 * i overheard criticisms of it, and in another class, i talked with my friend about it.
 * 
 * i made some rude remarks about the band members, and they might've heard
 * 
 * my friend pointed that out and i instantly felt really guilty
 * 
 * now i realize how snobby all those solos and shit i did were
 * 
 * so now i don't do solos (i also don't want to anyway because i'd rather spend my time composing) and i try to avoid showing anyone that's not my friend my projects
 * 
 * and about the piece i'm trying to get the band to play right now, i really just want to hear one of my works come to life in real life and not as musescore playback
 * 
 * and this year is my last chance to get that to happen because next year i'm not going to do band
 * 
 * i feel like i only did all those things because i hated myself so much, so maybe i wouldn't if everbody thought i was cool
 * 
 * but after every solo all i could think about was my worst moments instead of the crowd applauding
 * 
 * and i may have performed difficult stuff, but i am not a good performer
 * 
 * i can't sight read at all, i practice extremely slow, and i've lost any talent i did have
 * 
 * and i did not like to practice
 * 
 * it's 3:33 am
 * 
 * i have like 3 hours to sleep
 * 
 * i better just go sleep
 * */
if (array_length(messages) > 0) {
    draw_set_font(fancyfont);
	for (var i = 0; i < array_length(messages); i++) {
        var yy = 50 + i * 50;
        
        var sep = 20;
        var w = 150;
        var s = 4;
        
        var sw = string_width_ext(messages[i].message, sep, w);
        var sh = string_height_ext(messages[i].message, sep, w);
        draw_rectangle_colour(0, yy - s, sw + s, yy + sh + s, c_black, c_black, c_black, c_black, false);
        draw_rectangle_colour(0, yy - s, sw + s, yy + sh + s, c_red, c_red, c_red, c_red, true);
        draw_text_ext(2, yy, messages[i].message, sep, w);
        if (messages[i].duration > 0) {
        	messages[i].duration -= 1;
        }
        else {
            array_delete(messages, i, 1);
        }
    }
}