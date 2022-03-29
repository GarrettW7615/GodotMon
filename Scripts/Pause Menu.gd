extends Control

var isPaused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.isPaused = !isPaused

func set_is_paused(value):
	isPaused = value
	get_tree().paused = isPaused
	visible = isPaused


func _on_ResumeBtn_pressed():
	self.isPaused = false

func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_MainBtn_pressed():
	get_tree().change_scene("res://Scenes/Title Screen.tscn")
	self.isPaused = false
