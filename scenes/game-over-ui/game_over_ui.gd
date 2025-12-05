extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var space_label: Label = $SpaceLabel
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# this hides the control node making the visability false
	hide()
	# subscribing (connecting) to the on_plane_died signal and evoking a function
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if statemnet checking is the space label is visible and the space bar has been pressed
	if space_label.visible and Input.is_action_just_pressed("fly"):
		# if true switch scene to main scene
		GameManager.load_main_scene()

# function to run when the plane died signal is fired
func on_plane_died() -> void:
	# when the signal is emitted make the control node visible
	show()
	# start the one shot timer (2 sec)
	timer.start()
	# play the game over sound
	sound.play()
	# when the game is over we are saving the high score to file
	ScoreManager.save_high_score_to_file()
	

# timeout callback signal when the timer reaches 2 sec
func _on_timer_timeout() -> void:
	# hide the game over label
	game_over_label.hide()
	# Show the space Label
	space_label.show()
