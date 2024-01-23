// The instance stays for a moment to kill off specific enemies
alarm[0] = 60;
// Flip the image if facing away
if(global.mgAim == 180)image_xscale = -1;
else image_xscale = 1;