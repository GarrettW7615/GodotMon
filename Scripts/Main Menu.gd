extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load settings from file
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")

	if err != OK:
		print("Error loading settings")
	
	if config.get_value("Settings", "vsync") != null:
		OS.vsync_enabled = config.get_value("Settings", "vsync")
	if config.get_value("Settings", "fullscreen") != null:
		OS.window_fullscreen = config.get_value("Settings", "fullscreen")
	if config.get_value("Settings", "volume") != null:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), config.get_value("Settings", "volume"))
	
	if OS.vsync_enabled == true:
		$SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.pressed = true
	else:
		$SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.pressed = false
	if OS.window_fullscreen == true:
		$SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.pressed = true
	else:
		$SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.pressed = false
	
	$SettingsMenu/Background/CenterContainer/VBoxContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.connect("toggled", $SettingsMenu, "_on_VsyncBtn_toggled")
	$SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.connect("toggled", $SettingsMenu, "_on_FullscreenBtn_toggled")
	$SettingsMenu/Background/CenterContainer/VBoxContainer/VolumeSlider.connect("value_changed", $SettingsMenu, "_on_VolumeSlider_value_changed")
	
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
