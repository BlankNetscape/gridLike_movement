//Player Input
keyLeft =	keyboard_check(vk_left)	|| keyboard_check(ord("A"));
keyRight =	keyboard_check(vk_right)|| keyboard_check(ord("D"));  
keyUp =		keyboard_check(vk_up)	or keyboard_check(ord("W"));
keyDown =	keyboard_check(vk_down) or keyboard_check(ord("S"));
keyActivate =	keyboard_check_pressed(vk_space);
keyAttack =		keyboard_check_pressed(vk_shift);
keyItem =		keyboard_check_pressed(vk_control);

inputAngle = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp); //RETURN: in degrees; vector from 0,0 with radius 1 or 0
inputBalance = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0); // 1 or 0




//Movement
//NOTE: вся эта шняга для равномерного движения даже по диагонали.
//
//NOTE: Make vektor; Count x_len && y_len
//
hSpeed = lengthdir_x(inputBalance*speedWalk, inputAngle);
vSpeed = lengthdir_y(inputBalance*speedWalk, inputAngle);

x += hSpeed;
y += vSpeed;




//Update Sprite Index
var _oldSprite = sprite_index;
//:::If Action
if (inputBalance != 0)
{
	direction  = inputAngle;
	sprite_index = spriteRun;
}
//:::If Idle
else 
{
	sprite_index = spriteIdle;
}

//:::Set first frame of each pack
if (_oldSprite != sprite_index)   
{
	localFrame = 0;
}

//>>//Update Image Index
PlayerAnimateSprite();

