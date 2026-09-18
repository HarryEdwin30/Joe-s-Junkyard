function iwillfindyouandiwillrapeyou(target_x, target_y, m_spd){
if (instance_exists(obj_player)) {
    if (!variable_instance_exists(id, "path")) {
        path = path_add();
    }
    
    if (mp_grid_path(global.map_grid, path, x, y, target_x, target_y, true)) {
        path_start(path, m_spd, path_action_stop, false);
    }
} 
else exit;
}