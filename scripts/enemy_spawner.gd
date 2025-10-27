extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	# inline version
	# enemy_instance.global_position = spawn_positions_array.pick_random().global_position
	# add_child(enemy_instance)
	emit_signal("enemy_spawned", enemy_instance)


func _on_path_timer_timeout() -> void:
	spawn_path_enemy()

func spawn_path_enemy() -> void:
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
