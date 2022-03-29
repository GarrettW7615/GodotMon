extends Area2D

func _on_HometowntoHotDougRd_body_entered(body):
	get_parent().get_parent().get_node("CanvasLayer/Frame_GUI/Frame/FrameImg/CenterContainer/TownName").text = "Route 1"
	get_parent().get_parent().get_node("CanvasLayer/Frame_GUI/FrameSlide").play("Slide Frame")
