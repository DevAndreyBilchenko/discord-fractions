extends Node
export(int) var size = 15

onready var background = $Background
onready var border = $HexagonBorder

func _ready():
	create_polygon()
	scale_border()

func create_polygon():
	var points = [Vector2(0, size/2).rotated(deg2rad(60))]

	for i in range(2, 7):
		points.append(Vector2(0, size/2).rotated(deg2rad(60 * i)))

	points = PoolVector2Array(points)

	background.polygon = points

func scale_border():
	var scale = float(size) / float(border.texture.get_width())
	border.scale = Vector2(scale, scale)
