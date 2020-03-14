var x_position = argument0;
var y_position = argument1;
var impulse = argument2;
var color = argument3;

var spawn_amount = random_range(3, 5) * (abs(impulse) * .5);
for (var i = 0; i < 3; i++) {
    var inst = instance_create_layer(x_position, y_position, "background_effects", obj_blood);
	with (inst) {
		dx += random_range(1, 2) * impulse;
		dy -= random_range(1, 3);
		blood_color = color;
	}
}
