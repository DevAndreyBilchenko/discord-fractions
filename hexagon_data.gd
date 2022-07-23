class_name HexagonData
extends Resource

export(Color) var background_color = Color("#66ffffff") setget background_setter
export(Color) var border_color = Color("#ffffff") setget border_setter

func background_setter(new_value):
	background_color = new_value
	emit_signal("changed")

func border_setter(new_value):
	border_color = new_value
	emit_signal("changed")
