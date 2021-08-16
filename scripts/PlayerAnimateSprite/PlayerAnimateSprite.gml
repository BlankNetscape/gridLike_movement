function PlayerAnimateSprite(){
	//Convert degrees (0-360) into a number (0-3).
	var _spriteAngle = round(direction/90);
	//To do 8 directions for example: "round(direction/45)" should work.
	
	
	var _animStageTotalFrames = sprite_get_number(sprite_index) / 4;
	
	image_index = localFrame + (_spriteAngle * _animStageTotalFrames); // Set StageStep step by step
	
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE; // add step particle
	
	//If animation would loop on next game step
	if (localFrame >= _animStageTotalFrames)
	{
		//animationEnd = true;
		localFrame -= _animStageTotalFrames; // Set to first step of the stage
	} else {
		//animationEnd = false;
	}

}