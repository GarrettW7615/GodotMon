extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x += 1
	if Input.is_action_pressed("left"):
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x -= 1
		$PlayerSpriteAnimated.play("left")
	else:
		$PlayerSpriteAnimated.play("idle")
	if Input.is_action_pressed("down"):
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.y += 1
	if Input.is_action_pressed("up"):
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	speed = 100

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func _on_Player_House_body_entered(_body):
	$Camera2D.smoothing_enabled = false
	get_parent().get_node("AudioStreamPlayer2D").stop()
	get_parent().get_node("Player").position.x = 1463
	get_parent().get_node("Player").position.y = 1100
	$Camera2D.limit_bottom = 1120
	$Camera2D.limit_right = 1529
	$Camera2D.limit_left = 1033
	$Camera2D.limit_top = 624


func _on_PlayerHouseToHometown_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Camera2D.smoothing_enabled = false
	get_parent().get_node("AudioStreamPlayer2D").play()
	get_parent().get_node("Player").position.x = 820
	get_parent().get_node("Player").position.y = 258
	$Camera2D.limit_bottom = 605
	$Camera2D.limit_right = 1023
	$Camera2D.limit_left = 0
	$Camera2D.limit_top = 0
