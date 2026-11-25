key = "survivor_master";

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
} else {
    data = {
        initialized: false,
        survivors: {}
    }
}

initialized = data.initialized;
survivors = data.survivors;

initialize = function(survivor_count) {
    for (var i = 0; i < survivor_count; i++) {
    	var tag = "survivor_" + string(i);
        var gender = irandom_range(0, 2);
        var name = arv(global.name_pool[gender]);
        survivors[$ tag] = {
            gender: gender,
            name: name
        };
    }
}

if (!initialized) {
	initialize(20);
    initialized = true;
}