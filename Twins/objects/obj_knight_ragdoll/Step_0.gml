//this code is responsible for deleting joints if they are streatched too much
if(can_break==true)
{
  for(i=0; i<14; i++)
    if(j[i]!=noone)
      if(abs(physics_joint_get_value(j[i], phy_joint_reaction_force_x))>break_value || abs(physics_joint_get_value(j[i], phy_joint_reaction_force_y))>break_value)
      {
        physics_joint_delete(j[i]);
        j[i] = noone; 
      }
}

