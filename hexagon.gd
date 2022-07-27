extends Node
export(int) var size = 15

var size_y setget , _get_size_y
var gap_x setget , _get_gap_x
var data: HexagonData

export(NodePath) var background_np
export(NodePath) var border_np

func _ready():
	create_polygon()
	scale_border()


func setup(_data: HexagonData):
	data = _data
	update_color()
	var _err = data.connect("changed", self, "_on_data_changed")


func update_color():
	get_node(background_np).color = data.background_color
	get_node(border_np).modulate = data.border_color


func create_polygon():
	var points = [Vector2(0, size/2).rotated(deg2rad(60))]

	for i in range(2, 7):
		points.append(Vector2(0, size/2).rotated(deg2rad(60 * i)))

	points = PoolVector2Array(points)

	get_node(background_np).polygon = points


func scale_border():
	var border = get_node(border_np)
	var scale = float(size) / float(border.texture.get_width())
	border.scale = Vector2(scale, scale)


func _on_data_changed():
	update_color()


func _get_size_y():
	return sqrt(3) / 2 * size / 2 * 2

func _get_gap_x():
	return size / 4
