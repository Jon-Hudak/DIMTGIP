extends StaticBody2D
@export var max_health : float=500
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
func _on_timer_timeout_funcname() -> void:
	get_tree().reload_current_scene()
   

	var timer := Timer.new()
	timer.wait_time = 1.0 # 1 second
	timer.one_shot = true # don't loop, run once
	timer.autostart = true # start timer when added to a scene
	timer.connect("timeout", _on_timer_timeout_funcname)
	return add_child(timer)
		
		
		

