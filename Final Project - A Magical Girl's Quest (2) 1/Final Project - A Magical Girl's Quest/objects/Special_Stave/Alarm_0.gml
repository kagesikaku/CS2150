// Spawn a spike and launch it in the player's direction
var spike = instance_create_layer(x, y, "Instances", Enemy_Projectile);
with(spike)
{
	// Aim in the direction of the Magical Girl
	direction = point_direction(x, y, Magical_Girl.x, y);
	speed = 6;
}
// Restart the clock
alarm[0] = room_speed * 3;