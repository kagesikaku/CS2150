// Move selector up and down for the key presses
// Move up
if(keyboard_check_pressed(ord("W")))
{
	
	if(selectorValue = 1)
	{
		selectorValue = 4;
		y += 120;
	}
	else if(selectorValue > 1)
	{
		y -= 40;
		selectorValue -= 1;
	}
}
// Move down
if(keyboard_check_pressed(ord("S")))
{
	
	if(selectorValue = 4)
	{
		selectorValue = 1;
		y -= 120;
	}
	else if(selectorValue < 4)
	{
		y += 40;
		selectorValue += 1;
	}
}
// New game
if(selectorValue == 1 && keyboard_check_pressed(vk_enter))
{
	room_goto(Room1);
}
// Load game
if(selectorValue == 2 && keyboard_check_pressed(vk_enter))
{
	var _buff = buffer_load("MGLocation.json");
	// Read the buffer file
	var _json = buffer_read(_buff, buffer_text);
	// Parse the json file
	var save_struct = json_parse(_json);
	// Set all variables loaded from the file
	var target_room = asset_get_index(save_struct.current_room); // Go to the room
	room_goto(target_room);
}
// View controls
if(selectorValue == 3 && keyboard_check(vk_enter))
{
	room_goto(ControlRoom);
}
// Quit the game
if(selectorValue == 4 && keyboard_check_pressed(vk_enter))
{
	game_end();
}
// Get hurt when meeting stave
