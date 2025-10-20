extends CharacterBody2D


const SPEED = 300.0


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

	move_and_slide()
	
	var viewport_size = get_viewport_rect().size
	
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.x > viewport_size.x:
		#global_position.x = viewport_size.x
	#if global_position.y < 0:
		#global_position.y = 0
	#if global_position.y > viewport_size.y:
		#global_position.y = viewport_size.y
	
	#global_position.x = clampf(global_position.x, 0, viewport_size.x)
	#global_position.y = clampf(global_position.y, 0, viewport_size.y)

	global_position = global_position.clamp(Vector2(0,0), viewport_size)
