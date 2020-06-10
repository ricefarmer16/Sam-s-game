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
	elif Input.is_action_pressed("walk_Left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
