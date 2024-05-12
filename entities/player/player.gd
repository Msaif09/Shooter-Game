extends Node2D


var bullet_scene = preload("res://entities/bullet/bullet.tscn")
var direction:int = 0
var speed:int = 300
var player_half_width:int = 16


var shoot_time:= 0.8
var shoot_counter = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shoot_counter+=delta
	if Input.is_action_pressed("space_fire") and shoot_counter>shoot_time:
		shoot_counter = 0
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position.x = position.x
		bullet_instance.position.y = position.y-20
		get_parent().get_node("Bullets").add_child(bullet_instance)
		
		
	
#	if Input.is_action_pressed("restart_game"):
#		print("restart")
#		PROPERTY_USAGE_RESTART_IF_CHANGED
	
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	else:
		direction = 0
	
	
#	position.x += direction*speed*delta
	
	position.x = clamp(position.x+direction*speed*delta,player_half_width,400-player_half_width)
	
	



