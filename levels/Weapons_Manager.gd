extends Node2D

signal gun_changed

var current_weapon = null
var weapon_stack : Array=[]
var weapon_index=0
var next_weapon: String
var weapon_list={}
@export var _weapon_resources:Array[Weapon_Resource]
@export var start_weapons:Array[String]

func _ready():
	initialize(start_weapons)

func initialize(start_weapons:Array):
	for weapon in _weapon_resources:
		weapon_list[weapon.weapon_name]=weapon
		
	for i in start_weapons:
		weapon_stack.push_back(i)
		
	current_weapon = weapon_list[weapon_stack[0]]
	enter()

func _process(delta):
	if Input.is_action_just_pressed("change_weapon"):
		if weapon_index<weapon_stack.size()-1:
			weapon_index+=1
		else:
			weapon_index=0
		change_weapon(weapon_index)
		
	else:
		pass

func enter():
	#change to new weapon
	pass
func exit():
	#leaving current weapon
	pass
func change_weapon(weapon_index):
	emit_signal("gun_changed", weapon_list[weapon_stack[weapon_index]])
