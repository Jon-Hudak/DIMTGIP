extends Area2D

@export var speed : float = 100
@export var damage: float = 50

func _ready():
	pass


func _physics_process(delta):
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed 
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	queue_free()
	print("onenter")
	if body.has_method("take_damage"):
		body.take_damage(damage)
