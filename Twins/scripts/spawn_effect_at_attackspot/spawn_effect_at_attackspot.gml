var other_enemy = argument0;
var effect_obj = argument1;
var attackspot = argument2;

var joint_name = "none"
switch attackspot {
	case 0 :
		joint_name = "attackspot_high";
		break;
	case 1 :
		joint_name = "attackspot_middle";
		break;
	case 2 :
		joint_name = "attackspot_low";
		break;
	default:
		joint_name = "attackspot_middle";	
		break;
}
with other_enemy {
	var map = ds_map_create();
	skeleton_bone_state_get(joint_name, map);
	var xx = ds_map_find_value(map, "worldX");
	var yy = ds_map_find_value(map, "worldY");
	var inst = instance_create_layer(xx, yy, "front_effects", effect_obj);
	inst.image_xscale = facing_direction * -1;
}