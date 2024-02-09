extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.flip_h=randi_range(0,1)==0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

