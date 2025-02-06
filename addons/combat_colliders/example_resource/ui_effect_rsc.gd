@tool
class_name UIEffectComponent
extends Resource

## The amount of time the game is paused after the hit is made
var hit_stop: float = 0.0
## The amount of screen shake the game has everytime this hits`
var screen_shake_amount: float = 0.0


func _init() -> void:
	set_name("UI_Effect")


func _get_property_list() -> Array[Dictionary]:
	var property_list: Array[Dictionary] = []

	property_list.append(
		{
			"name": "hit_stop",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,10,or_greater"
		}
	)

	property_list.append(
		{
			"name": "screen_shake_amount",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,10,or_greater"
		}
	)

	return property_list
