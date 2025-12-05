extends Node2D
class_name Pipes

const OFF_SCREEN: float = -500
@onready var score_sound: AudioStreamPlayer = $ScoreSound
@onready var laser: Area2D = $Laser


# TESTING new scroll speeed varibale (Used for difficulty)
#var new_scroll_speed: float = 0

func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * GameManager.SCROLL_SPEED
	
	# TESTING Dificulty settings
	#position.x -= delta * new_scroll_speed

	check_off_screen()
	
func on_plane_died() -> void:
	set_process(false)

# back up function incase the callback signal on_screen_exited() does not emit a signal
func check_off_screen() -> void:
	if position.x < OFF_SCREEN:
		queue_free()

# TESTING function to set the new scroll speeed variable (Used for difficulty)
#func set_scroll_speed(value) -> void:
	#new_scroll_speed = value
	#print(new_scroll_speed , " = difficulty_speed")

func _on_screen_exited() -> void:
	queue_free()
	

func _on_pipe_body_entered(body: Node2D) -> void:
	
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("die") == true:
			#body.die()

	if body is Tappy:
		body.die() 

func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		score_sound.play()
		ScoreManager.increment_score()
		

	
