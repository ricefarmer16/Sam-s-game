extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const SPEED = 100
const MAX_SPEED = 200
const JUMP_HEIGHT = -500

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("walk_Right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("walk_Left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimatedSprite.play("idleSquat")
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = JUMP_HEIGHT
		if friction == true: 
			motion.x = lerp(motion.x, 0, 0.2)
		else:
			
			if friction == true: 
				motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	pass  
