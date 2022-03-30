extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.vsync_enabled == true:
		$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.pressed = true
	else:
		$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.pressed = false
	if OS.window_fullscreen == true:
		$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.pressed = true
	else:
		$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.pressed = false
	
	$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/VsyncBtn.connect("toggled", $GUI/PauseMenu/SettingsMenu, "_on_VsyncBtn_toggled")
	$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/FullscreenBtn.connect("toggled", $GUI/PauseMenu/SettingsMenu, "_on_FullscreenBtn_toggled")
	$GUI/PauseMenu/SettingsMenu/Background/CenterContainer/VBoxContainer/VolumeSlider.connect("value_changed", $GUI/PauseMenu/SettingsMenu, "_on_VolumeSlider_value_changed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
