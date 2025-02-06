@tool
class_name KnockbackComponent
extends Resource

## If knockback value is going to be represented by a vector or angle and magnitude
var is_vector: bool = false:
	set(value):
		is_vector = value
		notify_property_list_changed()

## Vector representation of the knockback
var knockback_vector: Vector2 = Vector2(0, 0)
## Angle of the knockback
var knockback_angle: float = 0.0
## Strength of the knockback
var knockback_magnitude: float = 0.0


func _init() -> void:
	set_name("Knockback")


## Returns a Vector2 for how much knockback a given hurtbox will give
func get_knockback() -> Vector2:
	if is_vector:
		return knockback_vector
	return Vector2.from_angle(deg_to_rad(knockback_angle)) * knockback_magnitude


func _get_property_list() -> Array[Dictionary]:
	var property_list: Array[Dictionary] = []

	property_list.append({"name": "is_vector", "type": TYPE_BOOL, "usage": PROPERTY_USAGE_EDITOR})

	if is_vector:
		property_list.append(
			{"name": "knockback_vector", "type": TYPE_VECTOR2, "usage": PROPERTY_USAGE_EDITOR}
		)

	else:
		property_list.append(
			{
				"name": "knockback_angle",
				"type": TYPE_FLOAT,
				"usage": PROPERTY_USAGE_EDITOR,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "-360,360,degrees"
			}
		)

		property_list.append(
			{
				"name": "knockback_magnitude",
				"type": TYPE_FLOAT,
				"usage": PROPERTY_USAGE_EDITOR,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "0,10,or_greater"
			}
		)

	return property_list
