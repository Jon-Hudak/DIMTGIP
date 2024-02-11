extends CharacterBody2D
@export var resource:Resource
@export var speed:float=100
@export var max_health : float=100
@export var damage : float = 20
var health
var sees_player=false
@onready var player = get_node("/root/GameLevel/Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	health=max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	var direction= global_position.direction_to(player.global_position)
	velocity=direction*speed
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().has_method("take_damage"):
			collision.get_collider().take_damage(damage)
		print("Collided with: ", collision.get_collider())
			



func take_damage(damage: float = 0):
	health-=damage
	if health<=0:
		#queue_free()
		health=max_health
		global_position=Vector2.ZERO


	
