extends Node

export(NodePath) var short_sidebar_np
export(NodePath) var main_sidebar_np
export(NodePath) var hex_list_np
export(NodePath) var hex_editor_np
export(Array, NodePath) var action_buttons

onready var hex_list = get_node(hex_list_np)

var current_hex_button_data

func _ready():
	var _err = hex_list.connect("button_add", self, "_on_hex_list_button_add")
	for action_button in action_buttons:
		var _err2 = get_node(action_button).connect("pressed", self, "_on_action_button_pressed")

func close(target: String):
	get_node(self[str(target, "_np")]).visible = false

func show(target: String):
	get_node(self[str(target, "_np")]).visible = true
	
func is_visible(target: String):
	return get_node(self[str(target, "_np")]).visible

func _on_hex_list_button_add(button):
	button.connect("pressed", self, "_on_hex_button_pressed")

func _on_hex_button_pressed(data):
	if is_visible("main_sidebar") && is_visible("hex_editor"):
		if data == current_hex_button_data:
			close("hex_editor")
			close("main_sidebar")
	else:
		show("main_sidebar")
		show("hex_editor")
	
	current_hex_button_data = data
	
func _on_action_button_pressed(type: String):
	match (type):
		"hex":
			if is_visible("hex_list") && is_visible("short_sidebar"):
				close("hex_list")
				close("hex_editor")
				close("main_sidebar")
				close("short_sidebar")
			else:
				show("short_sidebar")
				show("hex_list")
