extends KinematicBody2D

export (int) var speed = 50
var baseSpeed = 50
var velocity = Vector2()
# hometown, player_house, player_room, route_1
var currentArea = ""
var coming_from = ""
var lastActionPressed = ""
var loading = false

func _ready():
	get_parent().get_node("Camera2D").smoothing_enabled = false

# Input
func get_input():
	velocity = Vector2()
	speed = 50
	
	if Input.is_action_pressed("right"):
		lastActionPressed = "right"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			if speed != baseSpeed*2:
				speed *= 2
		velocity.x += 1
	if Input.is_action_pressed("left"):
		lastActionPressed = "left"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			if speed != baseSpeed*2:
				speed *= 2
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		lastActionPressed = "down"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			if speed != baseSpeed*2:
				speed *= 2
		velocity.y += 1
	if Input.is_action_pressed("up"):
		lastActionPressed = "up"
		get_parent().get_node("Camera2D").smoothing_enabled = true
		if Input.is_action_pressed("Sprint"):
			if speed != baseSpeed*2:
				speed *= 2
		velocity.y -= 1
	
	if Input.is_action_pressed("right"):
		$PlayerSpriteAnimated.play("right")
	elif Input.is_action_pressed("left"):
		$PlayerSpriteAnimated.play("left")
	elif Input.is_action_pressed("up"):
		$PlayerSpriteAnimated.play("backward")
	elif Input.is_action_pressed("down"):
		$PlayerSpriteAnimated.play("forward")
	
	if !Input.is_action_pressed("up") and !Input.is_action_pressed("down") and !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		if lastActionPressed == "up":
			$PlayerSpriteAnimated.play("facingBack")
		if lastActionPressed == "down":
			$PlayerSpriteAnimated.play("idle")
		if lastActionPressed == "left":
			$PlayerSpriteAnimated.play("idleLeft")
		if lastActionPressed == "right":
			$PlayerSpriteAnimated.play("idleRight")
	
	velocity = velocity.normalized() * speed
	speed = speed/2

func _physics_process(_delta):
	if !loading:
		get_input()
		velocity = move_and_slide(velocity)

# Houses
func _on_Player_House_body_entered(_body):
	loading = true
	currentArea = "player_house"
	coming_from = "hometown"
	get_parent().get_node("Loading Zones/Player House/DoorSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_PlayerHouseToHometown_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	loading = true
	currentArea = "hometown"
	coming_from = "player_house"
	get_parent().get_node("Loading Zones/Player House/DoorSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_Home_Stairs_body_entered(body):
	loading = true
	currentArea = "player_room"
	coming_from = "player_house"
	get_parent().get_node("Floor/Stairs/StairSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_PlayerRoom_Stairs_body_entered(body):
	loading = true
	currentArea = "player_house"
	coming_from = "player_room"
	get_parent().get_node("Floor/Stairs/StairSound").play()
	get_parent().get_node("Camera2D/Loading Animation").play("Loading Animation")

func _on_Loading_Animation_animation_finished(anim_name):
	get_parent().get_node("Camera2D").smoothing_enabled = false
	
	if currentArea == "player_house":
		get_parent().get_node("Camera2D/Music/Hometown Song").stop()
		if get_parent().get_node("Camera2D/Music/Home Song").playing == false:
			get_parent().get_node("Camera2D/Music/Home Song").play()
		# get_parent().get_node("Camera2D/MusicAnims/HometowntoPlayerHouse").play("HometowntoPlayerHouse")
		if coming_from == "player_room":
			get_parent().get_node("Player").position.x = 1487
			get_parent().get_node("Player").position.y = 953
			get_parent().get_node("Camera2D").limit_bottom = 1120
			get_parent().get_node("Camera2D").limit_right = 1529
			get_parent().get_node("Camera2D").limit_left = 1273
			get_parent().get_node("Camera2D").limit_top = 928
		else:
			get_parent().get_node("Player").position.x = 1463
			get_parent().get_node("Player").position.y = 1100
			get_parent().get_node("Camera2D").zoom.x = 0.13
			get_parent().get_node("Camera2D").zoom.y = 0.13
			get_parent().get_node("Camera2D").limit_bottom = 1120
			get_parent().get_node("Camera2D").limit_right = 1529
			get_parent().get_node("Camera2D").limit_left = 1273
			get_parent().get_node("Camera2D").limit_top = 928
	elif currentArea == "hometown":
		get_parent().get_node("Camera2D/Music/Home Song").stop()
		if get_parent().get_node("Camera2D/Music/Hometown Song").playing == false:
			get_parent().get_node("Camera2D/Music/Hometown Song").play()
		get_parent().get_node("Player").position.x = 820
		get_parent().get_node("Player").position.y = 258
		get_parent().get_node("Camera2D").zoom.x = 0.25
		get_parent().get_node("Camera2D").zoom.y = 0.25
		get_parent().get_node("Camera2D").limit_bottom = 605
		get_parent().get_node("Camera2D").limit_right = 1024
		get_parent().get_node("Camera2D").limit_left = 0
		get_parent().get_node("Camera2D").limit_top = 0
	elif currentArea == "player_room":
		get_parent().get_node("Player").position.x = 1675
		get_parent().get_node("Player").position.y = 967
		get_parent().get_node("Camera2D").limit_bottom = 1120
		get_parent().get_node("Camera2D").limit_right = 1733
		get_parent().get_node("Camera2D").limit_left = 1557
		get_parent().get_node("Camera2D").limit_top = 944
	
	loading = false;
	get_parent().get_node("Camera2D/Fade Out Loading Animation").play("Fade Out Loading Animation")
