//creating physics word
//physics_world_create(1/32);
//physics_world_gravity(0, 10);
//physics_world_update_iterations(20); 
//physics_world_update_speed(room_speed * 2); 

//creating walls 
ins = instance_create_depth(-40, 80, 0, SR_o_wall);
ins = instance_create_depth(room_width, 80, 80, SR_o_wall);

globalvar can_break, break_value;
can_break = false;   //set this to true if you want breakable ragdolls
break_value = 0.1;   //how sensitive joints will be smaller means more sensitive

