## A more Specific data class that deals with what a normal hurtbox would need
@tool
class_name HitBoxShape
extends HurtBoxShape

## Damage being done to the object
var damage: float = 0

var hitbox_info: Array[Resource] = []


func _get_property_list() -> Array[Dictionary]:
	var property_list: Array[Dictionary] = []

	property_list.append(
		{
			"name": "damage",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,10,0.1,or_greater, hide_slider"
		}
	)

	property_list.append(
		{
			"name": "hitbox_info",
			"type": TYPE_ARRAY,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_TYPE_STRING,
			"hint_string": str("%d/%d:Resource" % [TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE])
		}
	)

	return property_list
