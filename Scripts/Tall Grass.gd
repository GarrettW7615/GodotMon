extends Area2D

var rng = RandomNumberGenerator.new()

func _on_Tall_Grass_1_body_entered(body):
	$"Tall Grass".play("moving")
	get_parent().get_node("GrassSound").play()
	
	rng.randomize()
	var randNum = rng.randi_range(0, 10000)
	if randNum > 9750:
		get_tree().paused = true
		get_parent().get_parent().get_parent().get_node("Battle/Battle").visible = true
		get_parent().get_parent().get_parent().get_node("Battle/Battle/BattleMusic").play()

func _on_Tall_Grass_animation_finished():
	$"Tall Grass".play("idle")
