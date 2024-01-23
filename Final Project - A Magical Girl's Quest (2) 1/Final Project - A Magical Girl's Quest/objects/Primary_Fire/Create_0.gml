// Bullet speed goes forwards in two directions
hsp = 8;
if(global.mgAim == 0)
{
	move_towards_point(x+20, y, hsp);
}
else if(global.mgAim == 180)
{
	move_towards_point(x-20, y, hsp);
}