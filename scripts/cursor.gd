extends CharacterBody2D
@export var multiplier = 1
@onready var globals = get_node("/root/Globals")

var score_multiplier = multiplier

func _process(delta):
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("mb_left") && get_tree().current_scene.get_name() == "shooting range":
		$AudioStreamPlayer.play()
		_shot()
	$Sprite2D.frame_coords.x = globals.crosshair
	$Sprite2D.scale = Vector2(globals.crosshairScale / 2, globals.crosshairScale / 2) + Vector2(7,7)


func _shot():
	if $Area2D.get_overlapping_areas().size() > 0:
		globals.shot = true
		globals.score += 1 * multiplier
		
	pass


func _on_area_2d_area_entered(area):
	if area.has_method("_randomize_pos"):
		area._randomize_pos()
		pass
	pass 
