extends Control
## Displays player scores

var scores = [0, 0]

@onready var left_score = $LeftScore
@onready var right_score = $RightScore 


func _ready() -> void:
	reset_scores()


func add_score(paddle_side) -> void:
	match paddle_side:
		0 : 
			scores[0] += 1
			left_score.text = str(scores[0])
		1 : 
			scores[1] += 1
			right_score.text = str(scores[1])
		_ : return


func reset_scores() -> void:
	scores = [0, 0]
