extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()

onready var anim = $PlayerAnimation

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x += 1
	if Input.is_action_pressed("left"):
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.x -= 1
		$PlayerSpriteAnimated.play("left")
	else:
		$PlayerSpriteAnimated.play("idle")
	if Input.is_action_pressed("down"):
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.y += 1
	if Input.is_action_pressed("up"):
		if Input.is_action_pressed("Sprint"):
			speed = 200
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	speed = 100

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func _on_Door_body_entered(_body):
	print("Body entered")
	get_tree().change_scene("res://Scenes/InDoor.tscn")
