extends StaticBody2D

var targetPos = Vector2()

func _on_Area_body_entered(body):
	targetPos = get_parent().get_parent().get_parent().get_parent().get_node("Player").position
	
	if body == get_parent().get_parent().get_parent().get_parent().get_node("Player") && !get_parent().get_node("CliffTween").is_active() && self.rotation == 0:
		targetPos.y += 22
		get_parent().get_parent().get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idle")
		get_parent().get_node("CliffTween").interpolate_property(get_parent().get_parent().get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		get_parent().get_node("CliffTween").start()
	if body == get_parent().get_parent().get_parent().get_parent().get_node("Player") && !get_parent().get_node("CliffTween").is_active() && str(self.rotation) == "1.5708":
		targetPos.x -= 22
		get_parent().get_parent().get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idleLeft")
		get_parent().get_node("CliffTween").interpolate_property(get_parent().get_parent().get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		get_parent().get_node("CliffTween").start()
	if body == get_parent().get_parent().get_parent().get_parent().get_node("Player") && !get_parent().get_node("CliffTween").is_active() && str(self.rotation) == "4.71239":
		targetPos.x += 22
		get_parent().get_parent().get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("idleRight")
		get_parent().get_node("CliffTween").interpolate_property(get_parent().get_parent().get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		get_parent().get_node("CliffTween").start()
	if body == get_parent().get_parent().get_parent().get_parent().get_node("Player") && !get_parent().get_node("CliffTween").is_active() && str(self.rotation) == "3.14159":
		targetPos.y -= 22
		get_parent().get_parent().get_parent().get_parent().get_node("Player").loading = true
		get_parent().get_parent().get_parent().get_parent().get_node("Player/PlayerSpriteAnimated").play("facingBack")
		get_parent().get_node("CliffTween").interpolate_property(get_parent().get_parent().get_parent().get_parent().get_node("Player"), "position", get_parent().get_parent().get_parent().get_parent().get_node("Player").position, targetPos, 0.75, Tween.TRANS_BACK, Tween.EASE_IN)
		get_parent().get_node("CliffTween").start()
	print("in area, rotation: " + str(self.rotation))

func _on_CliffTween_tween_all_completed():
	get_parent().get_parent().get_parent().get_parent().get_node("Player").loading = false
