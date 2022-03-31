extends Area2D

var body_entered = false
var textbox_showing = false
var body_name = ""

func _unhandled_input(event):
	if event.is_action_pressed("select"):
		if body_entered == true:
			if textbox_showing == false:
				get_parent().loading = true
				textbox_showing = true
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextBox/Box/BoxText").text = body_name
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextSlide").play("Slide Text Box Up")
				
				if get_parent().lastActionPressed == "up":
					get_parent().get_node("PlayerSpriteAnimated").play("facingBack")
				if get_parent().lastActionPressed == "down":
					get_parent().get_node("PlayerSpriteAnimated").play("idle")
				if get_parent().lastActionPressed == "left":
					get_parent().get_node("PlayerSpriteAnimated").play("idleLeft")
				if get_parent().lastActionPressed == "right":
					get_parent().get_node("PlayerSpriteAnimated").play("idleRight")
			elif textbox_showing == true:
				get_parent().loading = false
				textbox_showing = false
				get_parent().get_parent().get_node("HUD/TextBoxGUI/TextSlide").play("Slide Text Box Down")

func _on_SelectBox_body_entered(body):
	body_name = body.name
	body_entered = true

func _on_SelectBox_body_exited(body):
	body_entered = false
