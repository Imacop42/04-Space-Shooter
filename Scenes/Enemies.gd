extends Node2D

export var probability_black = 0.25
export var probability_sparrow = 0.25
#I replaced the sparrow model with a Bluejay model, but it is still referred to as a sparrow in the code
export var probability_white = 0.05
export var probability_red = .01
onready var Blackbird_Enemy = load("res://Scenes/Blackbird Enemy.tscn")
onready var Whitebird_Enemy = load("res://Scenes/Whitebird Enemy.tscn")
onready var Cardinal_Enemy = load("res://Scenes/Cardinal Enemy.tscn")
onready var Sparrow_Enemy = load("res://Scenes/Sparrow Enemy.tscn")
func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability_black:
		var bb = Blackbird_Enemy.instance()
		add_child(bb)
	if randf() < probability_white:
		var wb = Whitebird_Enemy.instance()
		add_child(wb)
	if randf() < probability_red:
		var rb = Cardinal_Enemy.instance()
		add_child(rb)
	if randf() < probability_sparrow:
		var sb = Sparrow_Enemy.instance()
		add_child(sb)
