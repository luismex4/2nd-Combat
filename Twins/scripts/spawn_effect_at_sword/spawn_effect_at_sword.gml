var effect_obj = argument0;

with obj_player {
	var map = ds_map_create();
	skeleton_bone_state_get("blade", map);
	var xx = ds_map_find_value(map, "worldX");
	var yy = ds_map_find_value(map, "worldY");
	var inst = instance_create_layer(xx, yy, "front_effects", effect_obj);
	inst.image_xscale = facing_direction * -1;
}
