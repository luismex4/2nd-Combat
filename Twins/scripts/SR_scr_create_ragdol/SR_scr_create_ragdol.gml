/// @description SR_scr_create_ragdol(x, y);
/// @param x
/// @param  y

//script will create all parts of the ragdoll and all necessary joints

//all needed sprite dimensions
var hh = sprite_get_height(SR_s_head);
var tw = sprite_get_width(SR_s_torso);
var th = sprite_get_height(SR_s_torso);
var a1w = sprite_get_width(SR_s_arm1);
var a1h = sprite_get_height(SR_s_arm1);
var a2w = sprite_get_width(SR_s_arm2);
var a2h = sprite_get_height(SR_s_arm2);
var l1h = sprite_get_height(SR_s_leg1);
var l2h = sprite_get_height(SR_s_leg2);

//torso
ins1 = instance_create_depth(argument0, argument1, 0, SR_o_torso);

//head
ins2 = instance_create_depth(argument0, argument1 - th/2 - hh/2, 0, SR_o_head);

//arms
ins3 = instance_create_depth(argument0 - tw/2, argument1 - th/2 + a1w/2, 0, SR_o_arm1);
ins3.phy_rotation = 90;
ins4 = instance_create_depth(argument0 + tw/2, argument1 - th/2 + a1w/2, 0, SR_o_arm1);
ins4.phy_rotation = -90;

//forearms
ins5 = instance_create_depth(argument0 - tw/2 - a1h*0.7, argument1 - th/2 + a1w/2, 0, SR_o_arm2);
ins5.phy_rotation = 90;
ins6 = instance_create_depth(argument0 + tw/2 + a1h*0.7, argument1 - th/2 + a1w/2, 0, SR_o_arm2);
ins6.phy_rotation = -90;

//hands
ins7 = instance_create_depth(argument0 - tw/2 - a1h*0.7 - a2h*0.7, argument1 - th/2 + a1w/2, 0, SR_o_hand);
ins7.phy_rotation = 90;
ins8 = instance_create_depth(argument0 + tw/2 + a1h*0.7 + a2h*0.7, argument1 - th/2 + a1w/2, 0, SR_o_hand);
ins8.phy_rotation = -90;

//thighs
ins9 = instance_create_depth(argument0 - tw/4, argument1 + th/2, 0, SR_o_leg1);
ins10 = instance_create_depth(argument0 + tw/4, argument1 + th/2, 0, SR_o_leg1);

//calfs
ins11 = instance_create_depth(argument0 - tw/4, argument1 + th/2 + l1h*0.8, 0, SR_o_leg2);
ins12 = instance_create_depth(argument0 + tw/4, argument1 + th/2 + l1h*0.8, 0, SR_o_leg2);

//feet
ins13 = instance_create_depth(argument0 - tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.8, 0, SR_o_foot);
ins14 = instance_create_depth(argument0 + tw/4, argument1 + th/2 + l1h*0.8 + l2h*0.8, 0, SR_o_foot);
ins14.phy_rotation = 180;

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










