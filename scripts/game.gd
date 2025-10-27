extends Node2D

var lives = 3
var score = 0

var gameoverscene = preload("res://scenes/game_over_screen.tscn")

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

@onready var enemy_hit_sound = $EnemyHitSound
@onready var explode_sound = $ExplodeSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(lives)



func _on_deathzone_area_entered(area: Area2D) -> void:
	area.free()


func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_label(lives)
	explode_sound.play()
	if lives == 0:
		print("game over")
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		display_game_over(score)


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	enemy_hit_sound.play()
	#print ("Score: " + str(score))
	hud.set_score_label(score)

func display_game_over(finalScore: int) -> void:
	var gameoverscreen = gameoverscene.instantiate()
	gameoverscreen.set_score(finalScore)
	ui.add_child(gameoverscreen)
	
