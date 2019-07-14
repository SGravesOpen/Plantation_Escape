extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var motion=Vector2()


func _physics_process(delta):
	move_and_slide(motion)
	
	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
		
	
	pass

