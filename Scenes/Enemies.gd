extends Node2D

export var probability = 0.2
onready var Blackbird_Enemy = load("res://Scenes/Blackbird Enemy.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var bb = Blackbird_Enemy.instance()
		add_child(bb)
