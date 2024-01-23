global.enemyCount = 0;
// Set a global enemy count
if(room == Room1)
{
	global.enemyCount = 5;
}
else if(room == Room2)
{
	global.enemyCount = 10;
}
else if(room == Room3)
{
	global.enemyCount = 12;
}
else if(room == BossRoom)
{
	global.enemyCount = 1;
}
else
{
	global.enemyCount = 0;
}