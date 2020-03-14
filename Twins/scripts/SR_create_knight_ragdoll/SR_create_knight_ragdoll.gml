/// @description SR_scr_create_ragdol(x, y);
/// @param x
/// @param  y

//script will create all parts of the ragdoll and all necessary joints

//all needed sprite dimensions
var total_image_xscale = 1;
var total_image_yscale = 1;
var depth_for_all = 400;
var hh = sprite_get_height(spr_kn_head) * total_image_yscale;
var tw = sprite_get_width(spr_kn_torso) * total_image_xscale;
var th = sprite_get_height(spr_kn_torso) * total_image_yscale;
var a1w = sprite_get_width(spr_kn_l_arm) * total_image_xscale;
var a1h = sprite_get_height(spr_kn_l_arm) * total_image_yscale;
var a2w = sprite_get_width(spr_kn_r_arm) * total_image_xscale;
var a2h = sprite_get_height(spr_kn_r_arm) * total_image_yscale;
var l1h = sprite_get_height(spr_kn_l_thigh) * total_image_yscale;
var l2h = sprite_get_height(spr_kn_l_thigh) * total_image_yscale;


//torso
ins1 = instance_create_depth(argument0, argument1, depth_for_all, obj_knight_torso);
ins1.image_xscale = total_image_xscale;
ins1.image_yscale = total_image_yscale;

//head
ins2 = instance_create_depth(argument0, argument1 - th/2 - hh/2, depth_for_all, obj_knight_head);
ins2.image_xscale = total_image_xscale;
ins2.image_yscale = total_image_yscale;

//arms
ins3 = instance_create_depth(argument0 - tw/2, argument1 - th/2 + a1w/2, depth_for_all, obj_knight_larm);
ins3.phy_rotation = 90;
ins3.image_xscale = total_image_xscale;
ins3.image_yscale = total_image_yscale;
ins4 = instance_create_depth(argument0 + tw/2, argument1 - th/2 + a1w/2, depth_for_all, obj_knight_larm);
ins4.phy_rotation = -90;
ins4.image_xscale = total_image_xscale;
ins4.image_yscale = total_image_yscale;

//forearms
ins5 = instance_create_depth(argument0 - tw/2 - a1h*0.7, argument1 - th/2 + a1w/2, depth_for_all, obj_knight_rarm);
ins5.phy_rotation = 90;
ins5.image_xscale = total_image_xscale;
ins5.image_yscale = total_image_yscale;
ins6 = instance_create_depth(argument0 + tw/2 + a1h*0.7, argument1 - th/2 + a1w/2, depth_for_all, obj_knight_rarm);
ins6.phy_rotation = -90;
ins6.image_xscale = total_image_xscale;
ins6.image_yscale = total_image_yscale;

//hands
ins7 = instance_create_depth(argument0 - tw/2 - a1h*0.8 - a2h*0.9, argument1 - th/2, depth_for_all, obj_knight_hand);
ins7.phy_rotation = 90;
ins7.image_xscale = total_image_xscale;
ins7.image_yscale = total_image_yscale;
ins8 = instance_create_depth(argument0 + tw/2 + a1h*0.8 + a2h*0.9, argument1 - th/2, depth_for_all, obj_knight_hand);
ins8.phy_rotation = -90;
ins8.image_xscale = total_image_xscale;
ins8.image_yscale = total_image_yscale;

//thighs
ins9 = instance_create_depth(argument0 - tw/4, argument1 + th/2, depth_for_all, obj_knight_lleg);
ins9.image_xscale = total_image_xscale;
ins9.image_yscale = total_image_yscale;
ins10 = instance_create_depth(argument0 + tw/4, argument1 + th/2, depth_for_all, obj_knight_lleg);
ins10.image_xscale = total_image_xscale;
ins10.image_yscale = total_image_yscale;

//calfs
ins11 = instance_create_depth(argument0 - tw/4, argument1 + th/2 + l1h*0.8, depth_for_all, obj_knight_lleg);
ins11.image_xscale = total_image_xscale;
ins11.image_yscale = total_image_yscale;
ins12 = instance_create_depth(argument0 + tw/4, argument1 + th/2 + l1h*0.8, depth_for_all, obj_knight_lleg);
ins12.image_xscale = total_image_xscale;
ins12.image_yscale = total_image_yscale;

//feet
ins13 = instance_create_depth(argument0 - tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.9, depth_for_all, obj_knight_foot);
ins13.image_xscale = total_image_xscale;
ins13.image_yscale = total_image_yscale;
ins14 = instance_create_depth(argument0 + tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.9, depth_for_all, obj_knight_foot);
ins14.image_xscale = total_image_xscale;
ins14.image_yscale = total_image_yscale;
//ins14.phy_rotation = 180;
ins14.image_xscale *= -1;

//here all joins are created
//head + torso
j[1] = physics_joint_revolute_create(ins1, ins2, ins1.x, ins1.y - th/2, -30, 30, 1, 0, 0, 0, 0);

//torso + arms
j[2] = physics_joint_revolute_create(ins1, ins3, ins1.x - tw/2, ins1.y - th/2 + a1w/2, -120, 90, 1, 0, 0, 0, 0);
j[3] = physics_joint_revolute_create(ins1, ins4, ins1.x + tw/2, ins1.y - th/2 + a1w/2, -90, 120, 1, 0, 0, 0, 0);

//arms + forearms
j[4] = physics_joint_revolute_create(ins3, ins5, ins1.x - tw/2 - a1h*0.7, ins1.y - th/2 + a1w/2, -120, 0, 1, 0, 0, 0, 0);
j[5] = physics_joint_revolute_create(ins4, ins6, ins1.x + tw/2 + a1h*0.7, ins1.y - th/2 + a1w/2, 0, 120, 1, 0, 0, 0, 0);

//forearms + hands
j[6] = physics_joint_revolute_create(ins5, ins7, ins1.x - tw/2 - a1h*0.7 - a2h*0.7, ins1.y - th/2 + a1w/2, -10, 50, 1, 0, 0, 0, 0);
j[7] = physics_joint_revolute_create(ins6, ins8, ins1.x + tw/2 + a1h*0.7 + a2h*0.7, ins1.y - th/2 + a1w/2, -50, 10, 1, 0, 0, 0, 0);

//torso + thighs
j[8] = physics_joint_revolute_create(ins1, ins9, ins1.x - tw/4, ins1.y + th/2, -30, 90, 1, 0, 0, 0, 0);
j[9] = physics_joint_revolute_create(ins1, ins10, ins1.x + tw/4, ins1.y + th/2, -90, 30, 1, 0, 0, 0, 0);

//thighs + calfs
j[10] = physics_joint_revolute_create(ins9, ins11, argument0 - tw/4, argument1 + th/2 + l1h*0.8, -120, 0, 1, 0, 0, 0, 0);
j[11] = physics_joint_revolute_create(ins10, ins12, argument0 + tw/4, argument1 + th/2 + l1h*0.8, 0, 120, 1, 0, 0, 0, 0);

//calfs + feet
j[12] = physics_joint_revolute_create(ins11, ins13, argument0 - tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.8, -50, 20, 1, 0, 0, 0, 0);
j[13] = physics_joint_revolute_create(ins12, ins14, argument0 + tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.8, -20, 50, 1, 0, 0, 0, 0);










