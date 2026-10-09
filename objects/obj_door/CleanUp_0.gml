data.open = open;
data.broken = broken;
data.hp = hp;

global.data[$ key] = data;

if (array_contains(global.closed_obstacles, id)) {
    var index = array_get_index(global.closed_obstacles, id);
	array_delete(global.closed_obstacles, index, 1);
}
if (array_contains(global.breakable_obstacles, id)) {
    var index = array_get_index(global.breakable_obstacles, id);
	array_delete(global.breakable_obstacles, index, 1);
}
if (array_contains(global.opaque_obstacles, id)) {
    var index = array_get_index(global.opaque_obstacles, id);
	array_delete(global.opaque_obstacles, index, 1);
}