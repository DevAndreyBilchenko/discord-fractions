extends Button

export(NodePath) var toggle_target

func _ready():
	var _err = connect("pressed", self, "_on_button_pressed")
	
func _on_button_pressed():
	var target = get_node(toggle_target)
	target.get_parent().visible = !target.visible
	target.visible = !target.visible
