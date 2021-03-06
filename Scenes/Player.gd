extends KinematicBody2D

export var health = 100
export var score = 0
export var margin = 5
export var x_range = 700
export var acceleration = 0.1

var velocity = Vector2(0,0)

onready var VP = get_viewport_rect().size
onready var Strike = load("res://Scenes/Strike.tscn")
onready var Bullet_R = load("res://Scenes/Bullet_R.tscn")

signal health_changed
signal score_changed

func _ready():
	emit_signal("score_changed")
	emit_signal("health_changed")
	
	
func change_score(s):
	score += s
	emit_signal("score_changed")

func change_health(h):
	health += h
	emit_signal("health_changed")
	if health <= 0:
		die()
func die():
	var strike = Strike.instance()
	strike.position = position
	strike.get_node("Sprite").playing = true
	get_node("/root/Game/Strikes").add_child(strike)
	queue_free()
	get_tree().change_scene("res://Scenes/GAMEOVER.tscn")




func _physics_process(delta):
	if Input.is_action_pressed("Fire"):
		var b = Bullet_R.instance()
		b.position = position
		b.position.x += 25
		get_node("/root/Game/Bullets").fire(b)
		
		
	if Input.is_action_pressed("LEFT"):
		velocity.x -= acceleration
	if Input.is_action_pressed("RIGHT"):
		velocity.x += acceleration
	if Input.is_action_pressed("Up"):
		velocity.y -= acceleration
	if Input.is_action_pressed("DOWN"):
		velocity.y += acceleration
		
		
	if position.x > VP.x - x_range:
		velocity.x = 0
		position.x = VP.x - x_range
	if position.x < 0:
		velocity.x = 0
		position.x = 0
	if position.x > VP.x - margin:
		velocity.x = 0
		position.x = VP.x - margin
	if position.y < margin:
		velocity.y = 0
		position.y = margin
	if position.y > VP.y - margin:
		velocity.y = 0
		position.y = VP.y - margin
	
	
	
	
	
	
	var collision = move_and_collide(velocity)
