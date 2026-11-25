draw_outline = false;

next_day = function() {
    if (obj_bossfight_director.fought_horde) {
    	global.game_day += 1;
        glog("we sleppy", 2);
    }
};