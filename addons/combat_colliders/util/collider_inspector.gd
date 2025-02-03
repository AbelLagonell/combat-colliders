extends EditorInspectorPlugin

var object: Object

var before = [
			"_add_collision_current",
			"_add_collision_next",
			"_reset_frames_current",
			"_remove_frame_current",

			"_place_frame_after",
			"_place_frame_before",
			"_place_current_frame",
			"_remove_self",
		]
var after = [
			"_reset_frames_all",
			"_remove_frame_all"
		]
	

func _can_handle(_object: Object) -> bool:
	for method in after:
		if _object.has_method(method):
			object = _object
			return true
	for method in before:
		if _object.has_method(method):
			object = _object
			return true
	return false
	
func _parse_begin(_object: Object) -> void:
	for method in before:
		if (object.has_method(method)):
			var name: String = ""
			match method:
				"_add_collision_current":
					name = "Add Collider to Current Frame"
				"_add_collision_next":
					name = "Add Collider to Next Frame"
				"_reset_frames_current":
					name = "Delete Colliders in Current Frame"
				"_remove_frame_current":
					name = "Delete Current Frame"
				"_place_frame_after":
					name = "Place New Collider After This Frame"
				"_place_frame_before":
					name = "Place New Collider Before This Frame"
				"_place_current_frame":
					name = "Add Collider to this Frame"
				"_remove_self":
					name = "Remove Current Collider"
			var btn = Button.new()
			btn.text = name
			btn.pressed.connect(_on_method_pressed.bind(object, method))
			
			add_custom_control(btn)

func _parse_end(_object: Object) -> void:
	for method in after:
		if (object.has_method(method)):
			var name: String = ""
			match method:
				"_reset_frames_all":
					name = "Delete Colliders in All Frames"
				"_remove_frame_all":
					name = "Delete All Frames"
			var btn = Button.new()
			btn.text = name
			var style = StyleBoxFlat.new()
			style.bg_color = Color(0.5,0,0)
			btn.add_theme_stylebox_override("normal", style)
			btn.pressed.connect(_on_method_pressed.bind(object, method))
			
			add_custom_control(btn)

func _on_method_pressed(_object, method):
	_object.call_deferred(method)
