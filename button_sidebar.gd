extends Control

signal pressed(data)

export(String, "hex", "region") var type = ""

func _ready():
	var _err = get_node("Button").connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	emit_signal("pressed", type)
