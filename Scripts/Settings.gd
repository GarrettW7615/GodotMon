extends Control

var config = ConfigFile.new()

func _ready():
	pass

func _on_VsyncBtn_toggled(button_pressed):
	OS.vsync_enabled = !OS.vsync_enabled
	save_settings()

func _on_FullscreenBtn_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
	save_settings()

func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), $Background/CenterContainer/VBoxContainer/VolumeSlider.value)
	save_settings()

func save_settings():
	config.set_value("Settings", "vsync", OS.vsync_enabled)
	config.set_value("Settings", "fullscreen", OS.window_fullscreen)
	config.set_value("Settings", "volume", $Background/CenterContainer/VBoxContainer/VolumeSlider.value)
	config.save("user://settings.cfg")
