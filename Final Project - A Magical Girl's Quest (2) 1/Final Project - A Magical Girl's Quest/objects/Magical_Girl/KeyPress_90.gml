// Save the game whilst grounded
// Save the room locale, enemy count, and general location.
if(place_meeting(x, y, Save_Spawn) && vsp == 0)
{
	var save_struct = {
		// Get the x and y values of the player, as well as the room
		type: "block",
		current_room: room_get_name(room)
	}
	// Turning the struct into a string 
	var _json = json_stringify(save_struct);
	// Create a file writing buffer to write to json file
	var _buff = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	// Write data to the buffer
	buffer_write(_buff, buffer_text, _json);
	// Save buffer to the text file
	buffer_save(_buff, "MGLocation.json");
	// Delete the buffer
	buffer_delete(_buff);
}
