class_name Enemy
extends Area2D


var speed:int = 100
var enemy_half_width:int = 16



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position = Vector2(randi_range(0+enemy_half_width,400-enemy_half_width),0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed*delta


func _on_area_entered(area:Area2D):
	if area.name == "BulletArea":
		area.get_parent().queue_free()
		queue_free()
		get_parent().get_parent().get_node("Score").text = str(int(get_parent().get_parent().get_node("Score").text)+1)
