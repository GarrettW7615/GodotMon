extends Area2D

var targetPos = Vector2()

func _on_HometowntoHotDougRd_body_entered(body):
	targetPos = get_parent().get_parent().get_node("Player").position
	
	if Input.is_action_pressed("right"):
		get_parent().get_parent().get_node("Player").currentArea = "route_1"
		
		targetPos.x += 25
		
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idle")
		get_parent().get_parent().get_node("UI/Frame_GUI/Frame/FrameImg/CenterContainer/TownName").text = "Route 1"
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").stop()
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").play("Slide Frame")
		get_parent().get_parent().get_node("Camera2D").limit_top = -553
		get_parent().get_parent().get_node("Camera2D").limit_left = 964
		get_parent().get_parent().get_node("Camera2D").limit_bottom = 846
		get_parent().get_parent().get_node("Camera2D").limit_right = 2000
		
		get_parent().get_parent().get_node("Camera2D/Music/Hometown Song").stop()
		get_parent().get_parent().get_node("Camera2D/Music/Route1").play()
		
		get_parent().get_parent().get_node("Player/Tweens/SwitchZoneTwn").interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_LINEAR)
		get_parent().get_parent().get_node("Player/Tweens/SwitchZoneTwn").start()
	if Input.is_action_pressed("left"):
		get_parent().get_parent().get_node("Player").currentArea = "hometown"
		
		targetPos.x -= 25
		
		get_parent().get_parent().get_node("UI/Frame_GUI/Frame/FrameImg/CenterContainer/TownName").text = "Doug Village"
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").stop()
		get_parent().get_parent().get_node("UI/Frame_GUI/FrameSlide").play("Slide Frame")
		get_parent().get_parent().get_node("Camera2D").limit_bottom = 605
		get_parent().get_parent().get_node("Camera2D").limit_right = 1024
		get_parent().get_parent().get_node("Camera2D").limit_left = 0
		get_parent().get_parent().get_node("Camera2D").limit_top = 0
		
		get_parent().get_parent().get_node("Camera2D/Music/Hometown Song").play()
		get_parent().get_parent().get_node("Camera2D/Music/Route1").stop()
		
		get_parent().get_parent().get_node("Player/Tweens/SwitchZoneTwn").interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_LINEAR)
		get_parent().get_parent().get_node("Player/Tweens/SwitchZoneTwn").start()
	
	get_parent().get_parent().get_node("Player").loading = false
