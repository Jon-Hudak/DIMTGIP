extends CharacterBody2D

var speed : float = 0.0
var direction : Vector2 = Vector2.RIGHT

func _physics_process(delta):
	
	move_and_slide()

func move(delta:float) -> void:
	move_and_collide(direction*speed*delta)

func _on_death_timer_timeout():
	$DeathTimer.start(0.8)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
