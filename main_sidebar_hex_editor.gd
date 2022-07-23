extends Control

onready var border_color_picker = $VBoxContainer/BorderColorPickerButton
onready var background_color_picker = $VBoxContainer/BackgroundColorPickerButton

var data: HexagonData

func _ready():
	border_color_picker.connect("color_changed", self, "_on_border_picker_changed")
	background_color_picker.connect("color_changed", self, "_on_background_picker_changed")

func _on_border_picker_changed(color):
	data.border_color = color
	
func _on_background_picker_changed(color):
	data.background_color = color
	
func collect_data():
	data.border_color = border_color_picker.color
	background_color_picker.color = data.background_color

func setup(_data: HexagonData):
	data = _data
	border_color_picker.color = data.border_color
	background_color_picker.color = data.background_color
