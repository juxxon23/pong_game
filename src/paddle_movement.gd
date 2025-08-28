class_name PaddleMovement
extends Node

const SPEED : int = 600 # Rapidez (pixels/sec)
var direction : Vector2


func movement_direction(side: int) -> void:
	match side:
		-1 :	direction.y = Input.get_axis("ui2_up", "ui2_down")
		1 : direction.y = Input.get_axis("ui_up", "ui_down")


func movement_velocity() -> Vector2:
	if direction:
		return direction * SPEED	
	else:
		return Vector2.ZERO
