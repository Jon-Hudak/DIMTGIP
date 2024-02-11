extends Area2D

@export var speed : float = 100
@export var damage: float = 50
@export var sprite: CompressedTexture2D
@export var sprite_scale: float = 1

func _ready():
	if sprite:
		$Sprite2D.texture=sprite
		$Sprite2D.scale=Vector2(sprite_scale,sprite_scale)
		print("sprite")
	else:
		pass

func _physics_process(delta):
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed 
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
