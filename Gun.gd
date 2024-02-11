extends Area2D

signal gun_shot
var can_shoot = true
@export var fire_rate : float = 1
@export var resource:Resource
@export var bullet_scene: PackedScene
@export var current_weapon : Resource
@export var change_weapon_delay = 0.5
@onready var timer : Timer = $Timer 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$RotationAnchor/Gun1.texture=resource.gun_sprite
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var enemies_in_range =	get_overlapping_bodies()
	if enemies_in_range.size()>0:
		var target_enemy=enemies_in_range[0]
		look_at(target_enemy.global_position)
		if target_enemy.global_position.x<global_position.x:
			$RotationAnchor/Gun1.flip_v=true
		else: 
			$RotationAnchor/Gun1.flip_v=false
		if timer.time_left<=0:
			shoot()
		
	
	
	

func shoot():

	print(resource.weapon_name, "pew")
	var new_bullet = bullet_scene.instantiate() 
	new_bullet.sprite=resource.bullet_sprite
	new_bullet.damage=resource.damage
	new_bullet.global_position= %Muzzle.global_position
	new_bullet.global_rotation= %Muzzle.global_rotation
	new_bullet.sprite_scale=0.5
	%Muzzle.add_child(new_bullet)
	timer.start(resource.fire_rate)
	emit_signal("gun_shot")
	
func change_weapon():
	timer.start(resource.fire_rate)
	$RotationAnchor/Gun1.texture=resource.gun_sprite
