extends CharacterBody2D

@export var move_speed: float = 100
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var animOverride=false

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	velocity= input_direction * move_speed
	
	if velocity>Vector2.ZERO:
		anim.flip_h=false
		
	elif velocity<Vector2.ZERO:
		anim.flip_h=true
		
	if Input.is_action_pressed("shoot"):
		anim.animation="shooting"
		#flips animation if mouse is to the left of player
		anim.flip_h=get_global_mouse_position().x<position.x 
		
	elif velocity!=Vector2.ZERO and animOverride==false:
		anim.animation="walking"
	elif velocity==Vector2.ZERO and animOverride==false:
		anim.animation="standing"

	move_and_slide()
