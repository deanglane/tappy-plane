extends Node

# Scrolling speed of the game
const SCROLL_SPEED:float = 200.0 # max 120
#const GRAVITY: float = 1000.0 #1500 Max
const POWER: float = -250.0 #500 Max

const GROUP_PLANE:String = "Plane"


const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")
const SIMPLE_TRANSITION: PackedScene = preload("res://scenes/simple-transition/simple_transition.tscn")

# TESTING dictionary config 
const GAME_CONFIG: Dictionary = {
	"GRAVITY": 1000.0,
	"POWER": 250,
}

var next_scene: PackedScene

func load_next_scene(ns) -> void:
	next_scene = ns
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_game_scene() -> void:
	#get_tree().change_scene_to_packed(GAME)
	load_next_scene(GAME)
	
func load_main_scene() -> void:
	#get_tree().change_scene_to_packed(MAIN)
	load_next_scene(MAIN)
	
