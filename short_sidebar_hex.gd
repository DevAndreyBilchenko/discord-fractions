extends ScrollContainer

signal button_add(button)

export(NodePath) var editor_np
export(PackedScene) var hex_preview_button

onready var add_button = $VBoxContainer/AddButton
onready var add_marker = $VBoxContainer/AddMarker
onready var container = $VBoxContainer

func _ready():
	var _err = add_button.connect("pressed", self, "_on_add_pressed")

func _on_add_pressed():
	var button = hex_preview_button.instance()
	button.connect("pressed", self, "_on_hex_button_pressed")
	container.add_child_below_node(add_marker, button)
	emit_signal("button_add", button)
	
func _on_hex_button_pressed(data: HexagonData):
	var editor_node = get_node(editor_np)
	editor_node.setup(data)
