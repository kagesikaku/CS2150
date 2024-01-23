// Assigning key presses
// Right
var keyRight = keyboard_check(ord("D"));
// Left
var keyLeft = keyboard_check(ord("A"));
// Jump
var keyJump = keyboard_check_pressed(vk_space);
// Primary fire
var keyPrimary = keyboard_check_pressed(ord("M"));
// Secondary fire
var keySecondary = keyboard_check_pressed(ord("N"));
// Arcana Slave
var keyArcana = keyboard_check(ord("B"));



// The formula is as follows
// (1 - 0) * hspMove for right movement(positive)
// (0 - 1) * hspMove for left movement(negative)
hsp = (keyRight - keyLeft) * hspMove;
if(keyRight)
{
	global.mgAim = 0;
	image_xscale = 1;
}
if(keyLeft)
{
	global.mgAim = 180;
	image_xscale = -1;
}
// Add gravity to vertical speed each step
vsp = vsp + grav;

// If statement to check for jumping
if((jumpNumber > 0) && (keyJump))
{
	// Set vertical speed to the jump
	vsp = vspJump;
	// Decrease the jumps when jumping
	jumpNumber--;
	// Set falling to false
	falling = false;
}

// Are we hitting the wall from the left or right?
if(place_meeting(x + hsp, y, Wall))
{
	// While the absolute value of the speed is over .1, execute until complete
	while(abs(hsp) > .1)
	{
		// Decrease horizontal speed by half, never touch
		hsp *= 0.5;
		// If we don't hit the wall, add horizontal speed
		if(!place_meeting(x + hsp, y, Wall)) x += hsp;
	}
	// Set horizontal speed to 0
	hsp = 0;
}

// Set horizontal speed to 0 if neither key is being pressed
if(!keyRight && !keyLeft)
{
	hsp = 0;
}

// Add the hsp to the current x to simulate movement
x += hsp;

// Are we on the floor or in the air
if(place_meeting(x, y + vsp, Wall))
{
	// If vertical speed is greater than 0, set jumps to 2
	if(vsp > 0) jumpNumber = 2;
	// While we are awa from the floor > .1 vertical speed
	while(abs(vsp) > 0.1)
	{
		// Halve the vertical speed continuously
		vsp *= 0.5;
		// No collision? Add to the y value
		if(!place_meeting(x, y + vsp, Wall)) y += vsp;
	}
	// Set vertical speed to 0 as to not fall through the floor
	vsp = 0;
	// Set falling to true to reset and make jumps
	falling = true;
	
	
	// check for sequences in the layer
	var a = layer_get_all_elements(layer);
	// Set the jumper to true 
	jumper = true;
	// Loop that foes through the sequences, set var i = 0
	for(var i = 0; i < array_length(a); i++;)
	{
		// if out element, or thing obtained is a sequence
		if layer_get_element_type(a[i]) == layerelementtype_sequence
		{
			// If a sequence, destroy it
			layer_sequence_destroy(a[i]);
		}
	}
	// The player hits the ceiling
	if(place_meeting(x, y - vsp, Wall))
	{
		jumpNumber = 0;
	}
}
// Add y to the vertical speed
y += vsp;
// Check to see if I can jump or fell off the edge
if(vsp > 0 && falling == true)
{
	// Set the jump number to 1, as the initial jump is for the ground
	jumpNumber = 1;
}

// Primary fire function
if(keyPrimary)
{
	// Many of these instances can be created, it's the spammable projectile
	audio_play_sound(Star_Fling, 0, false);
	if(global.mgAim == 0)instance_create_layer(x, y-30, "Instances", Primary_Fire);
	else if(global.mgAim == 180)instance_create_layer(x-75, y-30, "Instances", Primary_Fire);
}
// Secondary fire
if(keySecondary && global.arcanaV >= 250)
{
	// Spawns a shotgun-like fire known as arcana beats
	if(global.mgAim == 0)instance_create_layer(x,y-40, "Instances", Secondary_Fire);
	else if(global.mgAim == 180)instance_create_layer(x-20,y-40, "Instances", Secondary_Fire);
	
	else image_xscale = 1;
	audio_play_sound(Arcana_Beats, 0, false);
	global.arcanaV -= 250;
}
if(keyArcana && global.arcanaV == 1000)
{
	instance_create_layer(x, y, "Instances", Arcana_Slave);
	
	global.arcanaV -= 1000;
	audio_play_sound(Arcana_Slave_SFX, 0 , false);
}
// Colliding with an enemy
if(place_meeting(x, y, Stave))
{
	Magical_Girl.x += 64;
	Magical_Girl.y -= 64;
	mg_hp -= 2;
	hsp = -5;
	vsp = -5;
	alarm[0] = 30;
}
// Death of a Magical Girl
if(mg_hp <= 0)
{
	instance_destroy();
	room_goto(GameOver);
}