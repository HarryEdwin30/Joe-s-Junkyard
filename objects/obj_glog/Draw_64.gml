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