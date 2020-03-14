//calcualting force that will be aplied to each part of the ragdoll
var impulse_x = argument0;
var impulse_y = argument1;
with(SR_o_part)
{
  vx = phy_position_x - impulse_x;
  vy = phy_position_y - impulse_y;
  
  d = point_distance(0, 0, vx, vy);
  
  if(d<300)
  {
    if(d!=0)
    {
      vx /= d;
      vy /= d;
    }
    
    force = 20*(1-d/300);
    
    physics_apply_impulse(impulse_x, impulse_y, force*vx, force*vy);
  }
}