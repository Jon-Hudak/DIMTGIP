extends CharacterBody2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@onready var gun = $Gun

@export var bullet_path = preload("res://bullet.tscn")
@export var move_speed: float = 100



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

func _on_weapons_manager_gun_changed(current_weapon):
	gun.resource=current_weapon
	gun.change_weapon()

func take_damage(damage):
	hide()
	var timer := Timer.new()
	timer.wait_time = 1.0 # 1 second
	timer.one_shot = true # don't loop, run once
	timer.autostart = true # start timer when added to a scene
	timer.connect("timeout", _on_timer_timeout_funcname)
	add_child(timer)
	
	
func _on_timer_timeout_funcname() -> void:
	# Do stuff here...
	get_tree().reload_current_scene()

	
	
	


func _on_gun_gun_shot():
	$AnimatedSprite2D.animation="shooting"
	animOverride=true
	$ShootAnimationTimer.start()
	


func _on_shoot_animation_timer_timeout():
	animOverride=false
