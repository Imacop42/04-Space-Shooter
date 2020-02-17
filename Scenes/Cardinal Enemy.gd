extends RigidBody2D


var velocity = Vector2(0,0)
export var min_speed = 300
export var max_speed = 400
export var damage = 25
export var score = 50

onready var Strike = load("res://Scenes/Strike.tscn")

func _ready():
	randomize()
	position.y = randi() % int(get_viewport_rect().size.y)
	position.x = 1056
	velocity.x = -max(randi() % max_speed, min_speed)
	contact_monitor = true
	set_max_contacts_reported(4)
	
func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name != "Bullet_R":
			pass
		velocity.x = 0
		velocity.y = 200
		
		if c.name == "Player":
			var strike = Strike.instance()
			strike.position = position
			strike.get_node("Sprite").playing = true
			get_node("/root/Game/Strikes").add_child(strike)
			c.change_health(-damage)
			queue_free()
			
	if position.x < -50:
		queue_free()
		
func _integrate_forces(state):
	state.set_linear_velocity(velocity)
