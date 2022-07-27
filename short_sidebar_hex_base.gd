extends Control

signal pressed(data)
signal drag_start(data)

var is_drag = false
var data: HexagonData = HexagonData.new()
onready var background = $Background
onready var border = $Border

func _ready():
	var _err = data.connect("changed", self, "_on_data_changed")
	setup()


func setup():
	background.modulate = data.background_color
	border.modulate = data.border_color


func _on_Button_pressed():
	emit_signal("pressed", data)


func _on_data_changed():
	setup()


func _on_Button_gui_input(event):
	if event is InputEventMouseMotion && event.button_mask == BUTTON_MASK_LEFT:
		if is_drag == false:
			emit_signal("drag_start", data)
			is_drag = true
	
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed == false:
		is_drag = false
