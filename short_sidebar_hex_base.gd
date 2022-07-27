extends Control

signal pressed(data)

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
