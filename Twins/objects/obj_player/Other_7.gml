/// @description Insert description here
// You can write your code in this editor

if(just_landed) {
	just_landed = false;
	attacking = false;
	ds_map_clear(hit_enemies);
}

switch status {
	case "idle":
		break;
	case "deflect":
	case "parry":
	case "dodging":
	case "blocked":
	case "hit":
	case "parry_end":
		status = "idle";
		break;
}
	
//attacking
//end of attack
if(attacking) {
	ds_map_clear(hit_enemies);
	attacking = false;
	attack_time = 0;
}