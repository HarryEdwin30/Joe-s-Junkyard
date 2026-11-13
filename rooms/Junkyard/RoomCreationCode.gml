tilemap = layer_tilemap_get_id("obstacles");
array_push(global.closed_obstacles, tilemap);
array_push(global.opaque_obstacles, tilemap);

var ml = layer_get_id("mainlayer");
//instance_create_layer(0, 0, ml, obj_day_message);

save_progress();
//audio_play_sound(ambience_junkyard, 0, true);