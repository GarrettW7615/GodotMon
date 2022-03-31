extends Area2D

var body_entered = false
var textbox_showing = false
var body_name = ""
var body_node

func _unhandled_input(event):
	if event.is_action_pressed("select"):
		if body_entered == true && body_node.get_node("Identifier") != null:
			if textbox_showing == false:
				# Textbox pop-up
				textbox_showing = true
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextBox/Box/BoxText").text = body_node.found_text
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextSlide").play("Slide Text Box Up")
				
				# Sound effect
				if body_node.get_node("Identifier").text == "tf_token":
					get_parent().get_parent().get_node("Camera2D/Music").currentlyPlaying.stream_paused = true
					get_parent().get_parent().get_node("Sound Effects/Item Found").play()
				
				# Handle animations
				get_parent().loading = true
				if get_parent().lastActionPressed == "up":
					get_parent().get_node("PlayerSpriteAnimated").play("facingBack")
				if get_parent().lastActionPressed == "down":
					get_parent().get_node("PlayerSpriteAnimated").play("idle")
				if get_parent().lastActionPressed == "left":
					get_parent().get_node("PlayerSpriteAnimated").play("idleLeft")
				if get_parent().lastActionPressed == "right":
					get_parent().get_node("PlayerSpriteAnimated").play("idleRight")
			elif textbox_showing == true:
				#Text box go down
				textbox_showing = false
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextSlide").play("Slide Text Box Down")
				
				# Handle TF Tokens
				if body_node.get_node("Identifier").text == "tf_token":
					get_parent().get_parent().get_node("Camera2D/Music").currentlyPlaying.stream_paused = false
					body_node.visible = false
					body_node.get_node("Col").disabled = true
				
				# Handle animations
				get_parent().loading = false

func _on_SelectBox_body_entered(body):
	body_node = body
	body_name = body.name
	body_entered = true

func _on_SelectBox_body_exited(body):
	body_entered = false
