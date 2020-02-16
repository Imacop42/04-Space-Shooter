extends AudioStreamPlayer2D

var ready1 = true
onready var default_timer1 = $Timer.wait_time

func _ready():
	pass


		
func _physics_process(delta):
	if Input.is_action_pressed("Fire"):
		if ready1:
			self.play()
			ready1 = false
			$Timer.start()


func _on_Timer_timeout():
	ready1 = true
