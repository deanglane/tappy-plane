extends ParallaxLayer

const IMG_WIDTH: float = 1920.0
const IMG_HEIGHT: float = 1080.0

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D
@export var scroll_scale: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# amount we are scrolling vs scroll speed of the pipes
	motion_scale.x = scroll_scale
	# scaling the image to squash to the height of the screen so it all looks in proportion
	var scale_f = get_viewport_rect().size.y / IMG_HEIGHT # 0.79
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	# telling the parallax layer how many pixels to scroll before mirroring the image
	motion_mirroring.x = IMG_WIDTH * scale_f
