draw_outline = false;
can_sleep = false;

next_day = function() {
    if (obj_bossfight_director.fought_horde && can_sleep) {
        can_sleep = false;
    	global.game_day += 1;
        obj_bossfight_director.been_to_town = false;
        if (obj_supplies_depot.bs - obj_supplies_depot.bsc < 0) {
        	obj_player.hungry = true;
            glog("You are hungry! And weak.", 5, hungrysound);
        } else {
            obj_supplies_depot.bs -= obj_supplies_depot.bsc;
            obj_player.hungry = false;
        }
    }
};