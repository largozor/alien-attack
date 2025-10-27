extends Control

@onready var score = $Score
@onready var livesleft = $LivesLeft

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_score_label(newScore: int) -> void:
	score.text = "SCORE: " + str(newScore)

func set_lives_label(newLives: int) -> void:
	livesleft.text = str(newLives)
