function glog(message, duration, sound){
    //duration is in seconds
    if (instance_exists(obj_glog)) {
        message_properties = {
            message: message,
            duration: duration * 60
        }
    	array_push(obj_glog.messages, message_properties);
        if (sound != undefined) {
            audio_play_sound(sound, 0, false);
        }
        else {
            audio_play_sound(notification1, 0, false);
        }
    }
}