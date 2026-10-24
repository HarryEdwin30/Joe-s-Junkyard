function push_out_of_closed(){
    m_spd = 0;
    path_end();
    var test_x = x;
    var test_y = y;
    var radius = 2;
    var max_radius = 32;
    var found = false;
    
    while (!found && radius < max_radius) {
        for (var angle = 0; angle < 360; angle += 45) {
            var check_x = x + lengthdir_x(radius, angle);
            var check_y = y + lengthdir_y(radius, angle);
            
            var _is_empty = true;
            if (place_meeting(check_x, check_y, global.closed_obstacles)) {
                _is_empty = false;
            }
            
            if (_is_empty) {
                test_x = check_x;
                test_y = check_y;
                found = true;
                break;
            }
        }
        radius += 4;
    }
    
    if (found) {
        x = test_x;
        y = test_y;
    }
}
