if (sleep_time > 0) {
    sleep_time -= 1;
    var x1 = -1;
    var y1 = -1;
    var x2 = 641;
    var y2 = 481;
    draw_set_colour(c_black);
    draw_rectangle(x1, y1, x2, y2, false);
} else if (run_sleep_protocol) {
    run_sleep_protocol = false;
    next_day();
}