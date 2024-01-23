// Plays specific music during certain sections
if(room == Room1 || room == Room2 || room == Room3)
{
	audio_stop_all();
	audio_play_sound(General_Combat_OST, 0, true);
}
else if(room == ControlRoom || room == TitleRoom)
{
	audio_stop_all();
	audio_play_sound(Title_Music, 0, true);
}
else if(room == GameOver)
{
	audio_stop_all();
	audio_play_sound(Game_Over_OST, 0, true);
}