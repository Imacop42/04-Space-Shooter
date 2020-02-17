extends Node2D


func _ready():
	get_node("/root/Game/Claw")




func _on_Sprite_animation_finished():
	queue_free()
