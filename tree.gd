extends StaticBody2D
@export var max_health : float=100
var health

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.flip_h=randi_range(0,1)==0
	health=max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(damage: float = 0):
	health-=damage
	if health<=0:
		queue_free()
