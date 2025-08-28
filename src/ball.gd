class_name Ball
extends CharacterBody2D

const INITIAL_SPEED : int = 500
const MAX_Y_VECTOR : float = 0.6

var speed : int
var acceleration : int = 50
var direction : Vector2
var side_shot : int
var win_size : Vector2
var first_shot : bool = true


func _ready() -> void:
	win_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	velocity = direction * speed
	on_collision(velocity, delta)


func spawn(side_dir: int) -> void:
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = INITIAL_SPEED
	if first_shot:
		direction = random_side(0)
		first_shot = false
		return
	
	direction = random_side(side_dir)


func on_collision(vel: Vector2, delta: float) -> void:
	var collision = move_and_collide(vel * delta)
	if collision:
		var collider = collision.get_collider()
		if collider is Paddle:
			side_shot = collider.pd_side
			speed += acceleration
			direction = new_direction(collider)
		else:
			direction = direction.bounce(collision.get_normal())


# Adds dynamism to the direction
func new_direction(collider):
	var dist_ball_pad = position.y - collider.position.y
	var new_dir : Vector2
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
		
	new_dir.y = (dist_ball_pad / (collider.pd_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()


func random_side(_side_x: int) -> Vector2:
	var rand_dir : Vector2
	if _side_x:
		rand_dir.x = _side_x
	else:
		rand_dir.x = [1, -1].pick_random()
	
	rand_dir.y = randf_range(-1, 1)
	return rand_dir.normalized()
