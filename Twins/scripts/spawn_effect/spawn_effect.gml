var xx = argument0;
var yy = argument1;
var fx_direction = argument2;
var effect_obj = argument3;

var inst = instance_create_layer(xx, yy, "background_effects", effect_obj);
inst.image_xscale = fx_direction;
