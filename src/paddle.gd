class_name Paddle
extends CharacterBody2D

@export var pd_side : int # Left: -1, Right: 1

var pd_mov : PaddleMovement
var pd_height : int

@onready var pd_coll = $CollisionShape2D


func _ready() -> void:
	pd_mov = PaddleMovement.new()
	pd_height = pd_coll.shape.size.y


func _physics_process(_delta: float) -> void:
	velocity = pd_mov.movement_velocity()	
	move_and_slide()


func _input(_event: InputEvent) -> void:
	pd_mov.movement_direction(pd_side)
