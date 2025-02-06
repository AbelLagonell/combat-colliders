@tool
class_name HurtBoxShape
extends CollisionShape2D
## A simple class that allows for [ColliderFrameData] to be able to detect collisions

## The frame that this collider belongs to
@export var frame: int = 0:
	set(_frame):
		frame = _frame

var _parent: CombatCollider


func _ready():
	_parent = get_parent()


func _remove_self():
	_parent._remove_single_collider(frame, self.name)


func _place_frame_after():
	_parent._add_collision_current(frame + 1)


func _place_frame_before():
	_parent._add_collision_current(frame - 1)


func _place_current_frame():
	_parent._add_collision_current(frame)
