extends ScrollContainer

export(NodePath) var editor_np
export(PackedScene) var hex_preview_button

onready var add_button = $VBoxContainer/AddButton
onready var add_marker = $VBoxContainer/AddMarker
onready var container = $VBoxContainer


func _ready():
	var _err = add_button.connect("pressed", self, "_on_add_pressed")
	var _err2 = get_node(editor_np).connect("changed", self, "_on_editor_changed")

func _on_add_pressed():
	var button = hex_preview_button.instance()
	button.connect("pressed", self, "_on_hex_button_pressed")
	container.add_child_below_node(add_marker, button)
	
func _on_hex_button_pressed(data: HexagonData):
	var editor_node = get_node(editor_np)
	
	if editor_node.visible:
		editor_node.visible = false
		return
		
	editor_node.visible = true
	editor_node.setup(data)
