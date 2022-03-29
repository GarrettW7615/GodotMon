extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
var currentArea = ""
var lastActionPressed = ""
var loading = false

func _ready():
	get_parent().get_node("Camera2D").smoothing_enabled = false

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		lastActionPressed = "right"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("right")
		velocity.x += 1
	if Input.is_action_pressed("left"):
		lastActionPressed = "left"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x -= 1
		$PlayerSpriteAnimated.play("left")
	if Input.is_action_pressed("down"):
		lastActionPressed = "down"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("forward")
		velocity.y += 1
	if Input.is_action_pressed("up"):
		lastActionPressed = "up"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			speed = 200
		$PlayerSpriteAnimated.play("backward")
		velocity.y -= 1
	
	if !Input.is_action_pressed("up") and !Input.is_action_pressed("down") and !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		if lastActionPressed == "up":
			$PlayerSpriteAnimated.play("facingBack")
		else:
			$PlayerSpriteAnimated.play("idle")
	
	velocity = velocity.normalized() * speed
	speed = 100

func _physics_process(_delta):
	if !loading:
		get_input()
		velocity = move_and_slide(velocity)

func _on_Player_House_body_entered(_body):
	loading = true
	currentArea = "HometowntoPlayerHouse"
	get_parent().get_node("Loading Zones/Player House/DoorSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_PlayerHouseToHometown_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	loading = true
	currentArea = "PlayerHousetoHometown"
	get_parent().get_node("Loading Zones/Player House/DoorSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_Home_Stairs_body_entered(body):
	loading = true
	currentArea = "PlayerHousetoPlayerRoom"
	get_parent().get_node("Floor/Stairs/StairSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_PlayerRoom_Stairs_body_entered(body):
	loading = true
	currentArea = "PlayerRoomtoPlayerHouse"
	get_parent().get_node("Floor/Stairs/StairSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_Loading_Animation_animation_finished(anim_name):
	get_parent().get_node("Camera2D").smoothing_enabled = false
	
	if currentArea == "HometowntoPlayerHouse":
		get_parent().get_node("Camera2D/Music/Hometown Song").stop()
		get_parent().get_node("Camera2D/Music/Home Song").play()
		get_parent().get_node("Player").position.x = 1463
		get_parent().get_node("Player").position.y = 1100
		get_parent().get_node("Camera2D").limit_bottom = 1120
		get_parent().get_node("Camera2D").limit_right = 1529
		get_parent().get_node("Camera2D").limit_left = 1033
		get_parent().get_node("Camera2D").limit_top = 624
	elif currentArea == "PlayerHousetoHometown":
		get_parent().get_node("Camera2D").smoothing_enabled = false
		get_parent().get_node("Camera2D/Music/Home Song").stop()
		get_parent().get_node("Camera2D/Music/Hometown Song").play()
		get_parent().get_node("Player").position.x = 820
		get_parent().get_node("Player").position.y = 258
		get_parent().get_node("Camera2D").limit_bottom = 605
		get_parent().get_node("Camera2D").limit_right = 2000
		get_parent().get_node("Camera2D").limit_left = 0
		get_parent().get_node("Camera2D").limit_top = 0
	elif currentArea == "PlayerHousetoPlayerRoom":
		get_parent().get_node("Player").position.x = 1675
		get_parent().get_node("Player").position.y = 967
		get_parent().get_node("Camera2D").zoom.x = 0.13
		get_parent().get_node("Camera2D").zoom.y = 0.13
		get_parent().get_node("Camera2D").limit_bottom = 1120
		get_parent().get_node("Camera2D").limit_right = 1733
		get_parent().get_node("Camera2D").limit_left = 1557
		get_parent().get_node("Camera2D").limit_top = 944
	elif currentArea == "PlayerRoomtoPlayerHouse":
		get_parent().get_node("Player").position.x = 1486
		get_parent().get_node("Player").position.y = 935
		get_parent().get_node("Camera2D").zoom.x = 0.25
		get_parent().get_node("Camera2D").zoom.y = 0.25
		get_parent().get_node("Camera2D").limit_bottom = 1120
		get_parent().get_node("Camera2D").limit_right = 1529
		get_parent().get_node("Camera2D").limit_left = 1033
		get_parent().get_node("Camera2D").limit_top = 624
	
	loading = false;
	get_parent().get_node("Camera2D/Fade Out Loading Animation").play("Fade Out Loading Animation")
