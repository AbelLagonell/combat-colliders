@tool
extends EditorPlugin

const ColliderInspectorPlugin = preload("util/collider_inspector.gd")
var collider_inspector_plugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here
	collider_inspector_plugin = ColliderInspectorPlugin.new()
	add_inspector_plugin(collider_inspector_plugin)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	if is_instance_valid(collider_inspector_plugin):
		remove_inspector_plugin(collider_inspector_plugin)
		collider_inspector_plugin = null
