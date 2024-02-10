extends Area2D
@onready var timer = $Timer
var can_shoot = true
var fire_rate : float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#hide()
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot"):
		#show()
		if can_shoot:
			shoot()
			can_shoot=false
			$Timer.start(fire_rate)
			
		

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	show()
	new_bullet.global_position= %Muzzle.global_position
	new_bullet.global_rotation= %Muzzle.global_rotation
	%Muzzle.add_child(new_bullet)
	
	


func _on_timer_timeout():
	can_shoot=true
