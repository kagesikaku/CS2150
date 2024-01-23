// Horizontal speed is determined by direction and movement speed
hsp = enemyDirection * speed;

// Stave idly walks left to right when hitting a wall
// Stop immediately, swipe at the player to illude to damage, start walk sequence again afterwards
if(place_meeting(x + hsp, y, Magical_Girl))
{
	// Stop
	hsp = 0;	
}

// Wait a second before moving again
else
{
	// Enemy changes direction(potential issue, enemies follow the direction formula
	// might need a better formula as (-1) * 4 = hsp, which fails to actually meet the wall proper)
	if(place_meeting(x + 10, y, Wall))
	{	
		if(hsp == -3)
		{
			x -= 10;
		}
		else if(hsp == 3)
		{
			x -= 10;
		}
		image_xscale *= -1; 
		enemyDirection *= -1;
		
	}
	if(!place_meeting(x + 10, y, Wall))
	{
		hsp = hsp;
	}
	
	
	// Get hurt when being hit by primary fire
	if(place_meeting(x, y, Primary_Fire))
	{
		stave_hp -= 2;
		with(Primary_Fire)
		if(distance_to_object(other.id) < 1) instance_destroy();
	}
	// Get hurt when being hit by secondary fire
	if(place_meeting(x, y, Secondary_Fire))
	{
		stave_hp -= 5;
	}
}
// Stop immediately, swipe at the player to illude to damage, start walk sequence again afterwards
if(stave_hp <= 0)
{
	// On death, play crumple sequence, lower enemy count, and destroy itself
	global.enemyCount = global.enemyCount - 2;
	instance_destroy();
}