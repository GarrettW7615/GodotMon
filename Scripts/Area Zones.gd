extends Area2D

func _on_HometowntoHotDougRd_body_entered(body):
	if Input.is_action_pressed("right"):
		get_parent().get_parent().get_node("UI/Frame_GUI/Frame/FrameImg/CenterContainer/TownName").text = "Route 1"
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").stop()
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").play("Slide Frame")
	if Input.is_action_pressed("left"):
		get_parent().get_parent().get_node("UI/Frame_GUI/Frame/FrameImg/CenterContainer/TownName").text = "Doug Village"
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").stop()
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").play("Slide Frame")
