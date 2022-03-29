extends Area2D

func _on_Tall_Grass_1_body_entered(body):
	$"Tall Grass".play("moving")
	get_parent().get_node("GrassSound").play()

func _on_Tall_Grass_animation_finished():
	$"Tall Grass".play("idle")
