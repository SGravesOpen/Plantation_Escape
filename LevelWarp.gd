#Warp
extends Area2D

export(String, FILE, "*.tscn") var Warp_Scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(Warp_Scene)
			