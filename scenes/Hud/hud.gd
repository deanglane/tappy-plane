extends Control

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var best_score: Label = $MarginContainer/BestScore

var best_high_score:String = "Best Score : " + str(ScoreManager.get_high_score())
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_updated.connect(on_score_updated)
	best_score.text = best_high_score

func on_score_updated(score: int) -> void:
	score_label.text = str(score)
	if score == ScoreManager.get_high_score():
		best_score.text = best_high_score
