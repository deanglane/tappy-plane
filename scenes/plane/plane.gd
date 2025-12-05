extends CharacterBody2D

class_name Tappy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound


#const GRAVITY: float = 1000.0 #1500 Max
#const POWER: float = -250.0 #500 Max


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# gives the plane a jump at the start of the game
	velocity = Vector2(0, GameManager.POWER)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += GameManager.GAME_CONFIG.GRAVITY * delta
	
	# evoking the fly function
	fly()
	
	move_and_slide()
	
	# if the plane collides with te floor barrier the evoke the die function
	if is_on_floor():
		die()

func fly() -> void:
	
	if Input.is_action_just_pressed("fly"):
		# setting the velocity.y to a negative number with is up.
		velocity.y = GameManager.POWER
		
		animation_player.play("power")

func die() -> void:
	#stops the physics process
	set_physics_process(false)
	
	# Stops the plane animations
	animated_sprite_2d.stop()
	
	# emit a custom signal for when the player dies (Game Over!)
	SignalManager.on_plane_died.emit()
	print("Game Over!")
	
	# Stop the sound from player
	sound.stop()
