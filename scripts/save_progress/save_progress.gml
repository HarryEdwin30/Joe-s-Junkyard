function save_progress(){
    global.data[$ global.save_key] = {
        current_room: room,
        player_x: obj_player.x,
        player_y: obj_player.y
    }
    global.save_game = true;
}

/*
 * i haven't written anything in a while
 * 
 * idk why
 * 
 * ig there was either nothing to write about or i just wanted to work on the game
 * 
 * i've made lots of art changes
 * 
 * I've been asking my friend to help with some of the art
 * 
 * i've asked him to make a sketch of the town
 * 
 * i hope it makes him feel less useless
 * 
 * idk
 * 
 * i just have a feeling that deep down he feels useless
 * 
 * so maybe doing something will help with that
 * 
 * we're both failing school and definitely gonna drop out
 * 
 * dude i just wanna drop out as soon as i can and start working
 * 
 * i probably wrote this somewhere else in this spaghetti code, but im finally fucking 15
 * 
 * it genuinely felt like i was 14 forever
 * 
 * 14 was such a big year for me
 * 
 * at the beginning i was still kind of that loser
 * 
 * but near the end i felt like i finally figured out who i am
 * 
 * 12 to early 14 were the most miserable years of my fucking life, and it's all really my fault
 * 
 * so im glad that finally is over
 * 
 * my stressors now are less of my past and more about the future
 * 
 * with me going to fail hs, i dont really know what's gonna happen to me
 * 
 * i prolly try and do the ged
 * 
 * this is lazy but i really dont wanna get a job until i can get out of school
 * 
 * but the thing is my parents hate the idea of me dropping out so they might genuinely keep me in school
 * 
 * even though all i do is get fs
 * 
 * well you know i guess my stressors really still are my fault
 * 
 * im the one who chooses to not do school work every day
 * 
 * it really makes me feel like i have no value
 * 
 * and i probably don't
 * 
 * everyone around me can do it
 * 
 * and i know i can too
 * 
 * but i js dont want to
 * 
 * im just tryna calm down rn so that maybe i'll be calm enough to work on the ui for the ammo depot
 * 
 * usually this helps
 * 
 * asmr helps
 * 
 * but not really by itself
 * 
 * it probably doesn't help that im drinking coke so ill go put that away
 * 
 * dude bottle coke fell off
 * 
 * canned coke tastes good ash still
 * 
 * but bottle coke just tastes... like something
 * 
 * i couldn't tell you what
 * 
 * but i can only have like one sip before i don't want anymore
 * 
 * like combos
 * 
 * the best way i can describe it is like drinking pool or bath/shower water
 * 
 * it makes you feel like bloated or that there's something wrong in your stomach
 * 
 * every other bottled soda is fine
 * 
 * i just dont know what the fuck coke's got going on
 * 
 * i was gonna record myself playing piano and drums for the first bossfight song
 * 
 * but i genuinely just can't stay on beat on piano even with a metronome
 * 
 * on that topic
 * 
 * i finally asked to play the drum kit on a song again in band
 * 
 * my band teacher was so fucking happy
 * 
 * i guess i was just bored and playing the drum kit is fun
 * 
 * god i fucked up so hard
 * 
 * first few attempts i was just fucking shit up or reading the music incorrectly
 * 
 * and then the cherry on top was when i accidentally dropped my stick
 * 
 * but i didn't feel embarrased
 * 
 * what have i to lose?
 * 
 * out of all the things to be embarrased about, that is the last thing
 * 
 * so today i came in and i studied the score better before playing
 * 
 * and today i was at least competent
 * 
 * i was gonna practice but im at my mom's house and there is no drum kit here
 * 
 * im still learning norwegian
 * 
 * but my vocabulary is very small
 * 
 * and i can't understand what someone's saying unless it's slowed down and there's captions
 * 
 * i've been watching peppa gris
 * 
 * i wanna cut myself but i genuinely hate doing it over here
 * 
 * the logistics is more difficult than at my dad's house
 * 
 * and the knife is so dull
 * 
 * i thought for so long that i was just too weak for deeper cuts
 * 
 * i was wondering why i couldn't get the same result i used to get
 * 
 * but i tried a sharper knife at my dad's house and i found out it was the knife not me
 * 
 * i think the gameplan here is to build the town before i start making the bossfights
 * 
 * because if i make the bossfights now i'll probably have to remake them anyway to balance them
 * 
 * idk if i want the player to start with just the hammer, or start with just the revolver,
 * 
 * or start with one random gun
 * 
 * i like the one random gun idea
 * 
 * i tried to make the revolver, shotgun, and rifle have the same value, just the value is found in different situations
 * 
 * like you don't want to use your shotgun on one zombie because that wastes a lot of potential,
 * 
 * and you can only carry so much ammo
 * 
 * same with ar
 * 
 * i actually just updated the whole bullet drawing system so that i could have the ar have spread
 * 
 * now the guns no longer have different draw variables
 * 
 * when you shoot it just sends the end x and y to an array as an object and then the draw event just draws from
 * 
 * the player pos to the x and y. to put it simply
 * 
 * back then i was literally doing the math for shooting AND drawing when all i had to do was the math for shooting
 * 
 * keep it simple, stupid
 * 
 * you know i think the best way to get better at optimizations is to just not worry about it until you need it
 * 
 * for so long that terrible bullet code was doing me well
 * 
 * so why fix it?
 * 
 * i didn't optimize it to make it cleaner for the sake of it, i optimized it because i actually had a problem
 * 
 * you should never be thinking "now, how can i make this even faster" until your fps is at 15
 * 
 * after so long of doing that, you'll naturally just write more optimized code by default
 * 
 * the worst thing you can do is try and study how to optimize code instead of just start coding
 * 
 * do the smartest thing YOU can think of rather than go on a several hour detour trying to find the best way
 * 
 * because if it's stupid and it works, it's not stupid - matt lowne
 * 
 * and if it doesn't work, then try something a little less stupid
 * 
 * but obviously if you know a fast method then definitely use it
 * 
 * using that method of getting better at optimization might bite you in the ass if you're new and trying to code a big
 * 
 * project like me
 * 
 * oh and has it bitten me in the ass
 * 
 * but in the end you're always going to have to rewrite stuff
 * 
 * i completely rewrote how this game worked under the hood
 * 
 * and you'd never notice
 * 
 * but guess what?
 * 
 * this project is super scalable now
 * 
 * and any dumbass could be a great coder
 * 
 * you don't need a high iq to be a master coder
 * 
 * you just need to know how to get yourself to start and how to handle fuck ups
 * 
 * this has been said so many times but the BEST way to learn is to fuck up
 * 
 * when people invent genius things, it's not because they just got the idea first try
 * 
 * it's because their old way of doing things stopped working
 * 
 * iq is really just how fast you can come up with solutions
 * 
 * not a measure of what you can actually build, given time
 * 
 * a genius can write idiot code
 * 
 * and an idiot can write genius code