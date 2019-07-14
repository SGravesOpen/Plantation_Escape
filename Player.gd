extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const UP = Vector2(0,-1)
const GRAVITY = 20
const acceleration = 50
const maxSPEED = 200
const JUMP_HEIGHT = -500
var motion=Vector2()


func _physics_process(delta):
	motion = move_and_slide(motion, UP)
	
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, maxSPEED)
		$Sprite.flip_h=false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-acceleration, -maxSPEED)
		$Sprite.flip_h=true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
	
	
	pass
