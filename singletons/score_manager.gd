extends Node

const SCORES_PATH = "user://tappy.txt"

var _score: int = 0
var _high_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_high_score()

# function to get the score and return it
func get_score() -> int:
	return _score

# function to get the high score and return it
func get_high_score() -> int:
	return _high_score
	
# triggers every time we score and sends the new value to the set_score function
func increment_score() -> void:
	set_score(_score + 1)

# function to set the score and update the high score 
func set_score(v: int) -> void:
	# Setting the score to the value parameter
	_score = v
	# checking if the current score is higher than the high score then update the high score
	if _score > _high_score:
		_high_score = _score		
	# emit the signal when the score has been updated
	# we can pass the .emit a parameter if we want
	SignalManager.on_score_updated.emit(_score)

# Saving the high score in a file to persist
func load_high_score() -> void:
	# variable for accessing the location of the game save file and setting it to read (or save)
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ)
	# safety check if the file exsists
	if file:
		# if exsists amd the length of the fdata is greater than 0 (this means there is a score saved)
		if file.get_length() > 0:
			
			# return stored as binary 
			#_high_score = file.get_32()
			
			# this makes it so instead of storing it as binary it stores in human readable string
			_high_score = file.get_as_text().to_int()
			
			print("Loaded Highscrore")
		else:
			print("Nothing in file")
			# always close you files
			file.close()
	else:
		print("Failed to load file")

func save_high_score_to_file() -> void:
	# variable for accessing the location of the game save file and setting it to read (or save)
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	# safety check if the file exsists
	if file:
		
		# saves the data as a 32 bit binary and then pass it the high score variable
		#file.store_32(_high_score)
		
		# The saves the file as a human readable string
		file.store_string(str(_high_score))
		
		# always close you files
		file.close()
		
