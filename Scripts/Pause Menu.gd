extends Control

var isPaused = false setget set_is_paused

func _ready():
	$SettingsMenu/Background/CenterContainer/VBoxContainer/BackBtn.connect("pressed", self, "_on_SettingsBackBtn_pressed")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if $SettingsMenu.visible == false:
			self.isPaused = !isPaused
			$CenterContainer/VBoxContainer/SaveBtn.text = "Save"
		else:
			_on_SettingsBackBtn_pressed()

func set_is_paused(value):
	isPaused = value
	get_tree().paused = isPaused
	visible = isPaused

func _on_ResumeBtn_pressed():
	self.isPaused = false
	$CenterContainer/VBoxContainer/SaveBtn.text = "Save"

func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_MainBtn_pressed():
	get_tree().change_scene("res://Scenes/Title Screen.tscn")
	self.isPaused = false

func _on_SettingsBtn_pressed():
	$CenterContainer.visible = false
	$Background.visible = false
	$SettingsMenu.visible = true

func _on_SettingsBackBtn_pressed():
	$CenterContainer.visible = true
	$Background.visible = true
	$SettingsMenu.visible = false
