extends Node

export(NodePath) var hex_list_np
export(NodePath) var hex_layout_np
export(NodePath) var camera_np
export(PackedScene) var hex_ps

onready var camera = get_node(camera_np)
var drag_item

func _ready():
	var _err = get_node(hex_list_np).connect("button_add", self, "_on_hex_list_button_add")

	set_process_input(false)


func _input(event):
	if event is InputEventMouseMotion && event.button_mask == BUTTON_MASK_LEFT:
		drag_item.position = camera.position + event.position
	
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT  && event.pressed == false:
		set_process_input(false)


func _on_hex_list_button_add(button):
	var _err = button.connect("drag_start", self, "_on_hex_button_drag")


func _on_hex_button_drag(data):
	var new_hex = hex_ps.instance()
	new_hex.setup(data)
	camera = get_node(camera_np)
	drag_item = new_hex
	get_node(hex_layout_np).add_child(new_hex)
	set_process_input(true)
