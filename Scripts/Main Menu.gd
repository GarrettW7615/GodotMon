extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleMusic.play()
	$SettingsMenu/Background/CenterContainer/VBoxContainer/BackBtn.connect("pressed", self, "_on_SettingsBackBtn_pressed")

func _on_Play_Button_pressed():
	get_tree().change_scene("res://Scenes/Hometown.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Settings_pressed():
	$CenterContainer.visible = false
	$SettingsMenu.visible = true

func _on_SettingsBackBtn_pressed():
	$CenterContainer.visible = true
	$SettingsMenu.visible = false
