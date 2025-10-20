extends Area2D

@export var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta:float) -> void:
	global_position.x += SPEED*delta*2
	


func _on_visible_notifier_screen_exited() -> void:
	queue_free()
