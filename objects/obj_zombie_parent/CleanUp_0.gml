if (variable_instance_exists(id, "path") && path_exists(path)) {
    path_delete(path);
}
audio_stop_sound(current_sound);