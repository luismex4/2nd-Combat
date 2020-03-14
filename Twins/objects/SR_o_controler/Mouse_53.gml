ins = instance_create_depth(mouse_x, mouse_y, 0, o_explosion); //drawing simple explosion

//calcualting force that will be aplied to each part of the ragdoll
with(SR_o_part)
{
  vx = phy_position_x - mouse_x;
  vy = phy_position_y - mouse_y;
  
  d = point_distance(0, 0, vx, vy);
  
  if(d<300)
  {
    if(d!=0)
    {
      vx /= d;
      vy /= d;
    }
    
    force = 20*(1-d/300);
    
    physics_apply_impulse(mouse_x, mouse_y, force*vx, force*vy);
  }
}

