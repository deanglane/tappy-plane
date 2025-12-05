extends Node2D

class_name Game

const PIPES: PackedScene = preload("res://scenes/Pipes/pipes.tscn")
const PLANE: PackedScene = preload("res://scenes/plane/plane.tscn")


@onready var spawn_u: Marker2D = $SpawnU
@onready var spawn_l: Marker2D = $SpawnL
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder
@onready var difficulty_timer: Timer = $DifficultyTimer

# TESTING difficulty setting
var difficulty_speed: float = GameManager.SCROLL_SPEED
var game_skill: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreManager.set_score(0)
	# connect the custom Global signal from the plane scene and coonect the callback signal
	SignalManager.on_plane_died.connect(_on_plane_died)
	# spawn pipe when game loads
	spawn_pipes()
	#spawn_timer.set_wait_time(0.5)
	spawn_timer.start(GameManager.SCROLL_SPEED / 100)
	# start difficulty timer
	difficulty_timer.start(20)
	
func spawn_pipes() -> void:
	# stores the new_pipes scene and instantiates it. (Similar to the PackedScene method)
	var new_pipes: Pipes = PIPES.instantiate()

	
	# stores a random float between the two markers the screen (yp = Y position)
	#var yp: float = randf_range(spawn_u.position.y, spawn_u.position.x)
	var yp1: float = randf_range(spawn_u.position.y, spawn_u.position.x) # Default Normal game mode
	var yp2: float = randf_range(200, 700) # Level 2 Difficulty game mode
	var yp3: float = randf_range(250, 650) # Level 3 Difficulty game mode

	
	# TESTING setting te position.x to off the screen using the markers which are placed off the screen and the new random value 
	if game_skill >= 0 and game_skill <= 1:
		new_pipes.position = Vector2(spawn_l.position.x, yp1)
	elif game_skill >= 2 and game_skill <= 4:
		new_pipes.position = Vector2(spawn_l.position.x, yp2)
	elif game_skill >= 5:
		new_pipes.position = Vector2(spawn_l.position.x, yp3)
		
	# TESTING sends the updated difficulty speed to the pipes script (DIfficulty Settings)
	#new_pipes.set_scroll_speed(difficulty_speed)
	
	# add the pipes to the node PipesHolder
	pipes_holder.add_child(new_pipes)
	
#func stop_pipes() -> void:
	# this is no longer needed since we are doing it now through using the signal manager global
	#for pipe in pipes_holder.get_children():
		#pipe.set_process(false)
	

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()

func _on_plane_died() -> void:
	spawn_timer.stop()
	#stop_pipes()

# TESTING difficulty increase at 60 seconds
func _on_difficulty_timer_timeout() -> void:
	
	# TESTING difficulty Settings
	#SignalManager.on_difficulty_increase.emit()
	
	if difficulty_speed < 80:
		# this give the player a breather after the game gets intense
		difficulty_speed = 180
	else:
		print("Next Level")
		var new_game_speed = GameManager.SCROLL_SPEED
		new_game_speed = difficulty_speed - 10
		spawn_timer.wait_time = new_game_speed / 100
		difficulty_speed = new_game_speed
		game_skill += 1
		print("Game Skill Level ", game_skill)
	
