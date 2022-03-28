extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
var currentArea = ""

func get_input():
	velocity = Vector2()
	var lastActionPressed = "down"
	
	if Input.is_action_pressed("right"):
		lastActionPressed = "right"
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("right")
		velocity.x += 1
	if Input.is_action_pressed("left"):
		lastActionPressed = "left"
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x -= 1
		$PlayerSpriteAnimated.play("left")
	if Input.is_action_pressed("down"):
		lastActionPressed = "down"
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("forward")
		velocity.y += 1
	if Input.is_action_pressed("up"):
		lastActionPressed = "up"
		$Camera2D.smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("backward")
		velocity.y -= 1
	
	if !Input.is_action_pressed("up") and !Input.is_action_pressed("down") and !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		if lastActionPressed == "up":
			$PlayerSpriteAnimated.play("facingBack")
		elif lastActionPressed == "left" or lastActionPressed == "right" or lastActionPressed == "down":
			$PlayerSpriteAnimated.play("idle")
	
	if Input.is_action_pressed("quit_game"):
		get_tree().quit()
	
	velocity = velocity.normalized() * speed
	speed = 100

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func _on_Player_House_body_entered(_body):
	currentArea = "HometowntoPlayerHouse"
	get_parent().get_node("Player/Camera2D/Loading Animation").play("Loading Animation")


func _on_PlayerHouseToHometown_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	currentArea = "PlayerHousetoHometown"
	get_parent().get_node("Player/Camera2D/Loading Animation").play("Loading Animation")


func _on_Loading_Animation_animation_finished(anim_name):
	$Camera2D.smoothing_enabled = false
	
	if currentArea == "HometowntoPlayerHouse":
		get_parent().get_node("AudioStreamPlayer2D").stop()
		get_parent().get_node("Player").position.x = 1463
		get_parent().get_node("Player").position.y = 1100
		$Camera2D.limit_bottom = 1120
		$Camera2D.limit_right = 1529
		$Camera2D.limit_left = 1033
		$Camera2D.limit_top = 624
	elif currentArea == "PlayerHousetoHometown":
		$Camera2D.smoothing_enabled = false
		get_parent().get_node("AudioStreamPlayer2D").play()
		get_parent().get_node("Player").position.x = 820
		get_parent().get_node("Player").position.y = 258
		$Camera2D.limit_bottom = 605
		$Camera2D.limit_right = 1023
		$Camera2D.limit_left = 0
		$Camera2D.limit_top = 0
	get_parent().get_node("Player/Camera2D/Fade Out Loading Animation").play("Fade Out Loading Animation")


func _on_Fade_Out_Loading_Animation_animation_finished(anim_name):
	pass # Replace with function body.
