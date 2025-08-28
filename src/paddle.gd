extends CharacterBody2D

@export var side : int # Left: 0, Right: 1

var pd_mov : PaddleMovement


func _ready() -> void:
	pd_mov = PaddleMovement.new()


func _physics_process(_delta: float) -> void:
	velocity = pd_mov.movement_velocity()
	move_and_slide()


func _input(_event: InputEvent) -> void:
	pd_mov.movement_direction(side)
