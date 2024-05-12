extends Node2D


var enemy_scene = preload("res://entities/enemies/enemy.tscn")
var score = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _create_enemy():
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)


func _the_end(body:Node):
	if body is Enemy:
		get_tree().set_pause(true)
		get_parent().get_node("game_over").show()
		


func _on_boundary_area_entered(body):
	_the_end(body)



