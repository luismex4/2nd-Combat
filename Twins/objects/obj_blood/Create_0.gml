
collision = false;
dy = 0;
dx = 0;
grav = 0.75;
v_speed = grav;

blood_color = c_white;

cut_off_mask_x = 0;
cut_off_mask_y = 0;

var rand_scale = random_range(.2, .5);
image_xscale = rand_scale;
image_yscale = rand_scale;

//tile map info
var l = layer_get_id("static_collision");
static_tilemap = layer_tilemap_get_id(l);

sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);