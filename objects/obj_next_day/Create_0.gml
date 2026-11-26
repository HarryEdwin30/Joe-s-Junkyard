draw_outline = false;
can_sleep = false;

next_day = function() {
    can_sleep = false;
    global.game_day += 1;
    obj_bossfight_director.been_to_town = false;
    if (obj_supplies_depot.bs - obj_supplies_depot.bsc < 0) {
        obj_player.hungry = true;
        obj_supplies_depot.bs = 0;
        glog("You are hungry! And weak.", 5, hungrysound);
    } else {
        obj_supplies_depot.bs -= obj_supplies_depot.bsc;
        obj_player.hungry = false;
    }
    var ml = layer_get_id("mainlayer");
    instance_create_layer(0, 0, ml, obj_day_message);
    obj_player.can_move = true;
    global.menu = false;
    save_progress();
};

run_sleep_protocol = false; //aura

sleep_time_max = 210;
sleep_time = 0;