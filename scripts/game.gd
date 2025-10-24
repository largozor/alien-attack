extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(lives)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_deathzone_area_entered(area: Area2D) -> void:
	area.die()


func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_label(lives)
	if lives == 0:
		print("game over")
		player.die()


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	#print ("Score: " + str(score))
	hud.set_score_label(score)
