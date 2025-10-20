extends CharacterBody2D


const SPEED = 300.0

var rocketscene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = get_node("RocketContainer")



func _physics_process(delta: float) -> void:

	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("move_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED
	if Input.is_action_just_pressed("fire"):
		fire()

	move_and_slide()
	
	var viewport_size = get_viewport_rect().size

	global_position = global_position.clamp(Vector2(0,0), viewport_size)

func fire() -> void:
	
	var rocket_instance = rocketscene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 70
