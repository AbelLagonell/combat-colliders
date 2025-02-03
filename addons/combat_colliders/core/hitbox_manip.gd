## A more Specific data class that deals with what a normal hurtbox would need
@tool
class_name HitBoxShape
extends HurtBoxShape

## Damage being done to the object
@export_range(0,10,0.1,"or_greater", "hide_slider") var damage: float = 0

# Knockback
@export_group("Knockback")
## If this has a knockback value
var has_knockback: bool = false:
	set(value):
		has_knockback = value
		notify_property_list_changed()
## If knockback value is going to be represented by a vector or angle and magnitude
var is_vector: bool = false:
	set(value):
		is_vector = value
		notify_property_list_changed()

## Vector representation of the knockback
var knockback_vector: Vector2 = Vector2(0,0)
## Angle of the knockback
var knockback_angle: float = 0.0
## Strength of the knockback
var knockback_magnitude: float = 0.0

# UI
## Whether or not this hitbox will have a UI effect
var has_ui_effect: bool = false:
	set(value):
		has_ui_effect = value
		notify_property_list_changed()
## The amount of time the game is paused after the hit is made
var hit_stop: float = 0.0
## The amount of screen shake the game has everytime this hits`
var screen_shake_amount: float = 0.0

## Returns a Vector2 for how much knockback a given hurtbox will give
func get_knockback() -> Vector2:
	if is_vector:
		return knockback_vector
	else:
		return Vector2.from_angle(deg_to_rad(knockback_angle)) * knockback_magnitude

func _get_property_list() -> Array[Dictionary]:
	var property_list: Array[Dictionary] = []
	
	property_list.append({
		"name": "has_knockback",
		"type": TYPE_BOOL,
		"usage": PROPERTY_USAGE_EDITOR
	})
	
	if has_knockback:
		property_list.append({
			"name": "is_vector",
			"type": TYPE_BOOL,
			"usage": PROPERTY_USAGE_EDITOR
		})
		
		if is_vector:
			property_list.append({
				"name": "knockback_vector",
				"type": TYPE_VECTOR2,
				"usage": PROPERTY_USAGE_EDITOR
			})
		
		if !is_vector:
			property_list.append({
				"name": "knockback_angle",
				"type": TYPE_FLOAT,
				"usage": PROPERTY_USAGE_EDITOR,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "-360,360,degrees"
			})
			
			property_list.append({
				"name": "knockback_magnitude",
				"type": TYPE_FLOAT,
				"usage": PROPERTY_USAGE_EDITOR,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "0,10,or_greater"
			})
	
	property_list.append({
		"name": "UI Effect",
		"type": TYPE_STRING,
		"usage": PROPERTY_USAGE_GROUP
	})
	
	property_list.append({
		"name": "has_ui_effect",
		"type": TYPE_BOOL,
		"usage": PROPERTY_USAGE_EDITOR
	})
	
	if has_ui_effect:
		property_list.append({
			"name": "hit_stop",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,10,or_greater"
		})
		
		property_list.append({
			"name": "screen_shake_amount",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_EDITOR,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,10,or_greater"
		})
	
	return property_list
