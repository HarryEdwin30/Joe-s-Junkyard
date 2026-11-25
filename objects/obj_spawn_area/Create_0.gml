key = "spawn_area_" + string(room) + "_" + string(x) + "_" + string(y);
initialized = false;

initialize = function() {
    if (struct_exists(global.data, key)) {
    	data = global.data[$ key];
    } else {
        data = {
            walkers: walkers,
            runners: runners,
        }
    }
    
    walkers = data.walkers;
    runners = data.runners;
    initialized = true;
}