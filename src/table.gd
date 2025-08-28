extends Node2D


func _on_border_left_body_entered(body: Node2D) -> void:
	if body is Ball:
		get_tree().call_group("score", "add_score", 1)


func _on_border_right_body_entered(body: Node2D) -> void:
	if body is Ball:
		get_tree().call_group("score", "add_score", -1)
