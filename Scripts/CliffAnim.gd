extends Node2D

var targetPos = Vector2()

func _on_Area_body_entered(body):
	targetPos = get_parent().get_parent().get_node("Player").position
	targetPos.y += 20
	
	if body == get_parent().get_parent().get_node("Player") && !$CliffTween.is_active():
		get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idle")
		get_parent().get_parent().get_node("Floor/Cliffs/Cliff/Area").monitoring = false
		$CliffTween.interpolate_property(get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		$CliffTween.start()

func _on_CliffTween_tween_all_completed():
	get_parent().get_parent().get_node("Floor/Cliffs/Cliff/Area").monitoring = true
	get_parent().get_parent().get_node("Player").loading = false
