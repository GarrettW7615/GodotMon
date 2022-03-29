extends Node2D

var targetPos = Vector2()

func _on_Area_body_entered(body):
	targetPos = get_parent().get_parent().get_node("Player").position
	
	if body == get_parent().get_parent().get_node("Player") && !$CliffTween.is_active() && Input.is_action_pressed("down"):
		targetPos.y += 22
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idle")
		$CliffTween.interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		$CliffTween.start()
	if body == get_parent().get_parent().get_node("Player") && !$CliffTween.is_active() && Input.is_action_pressed("left"):
		targetPos.x -= 22
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idleLeft")
		$CliffTween.interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		$CliffTween.start()
	if body == get_parent().get_parent().get_node("Player") && !$CliffTween.is_active() && Input.is_action_pressed("right"):
		targetPos.x += 22
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idleRight")
		$CliffTween.interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		$CliffTween.start()
	if body == get_parent().get_parent().get_node("Player") && !$CliffTween.is_active() && Input.is_action_pressed("up"):
		targetPos.y -= 22
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("facingBack")
		$CliffTween.interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		$CliffTween.start()

func _on_CliffTween_tween_all_completed():
	get_parent().get_parent().get_node("Player").loading = false
