extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/VBoxContainer/ItemsBtn.connect("pressed", self, "_on_ItemsBtn_press")
	$Inventory/BackContainer/BackBtn.connect("pressed", self, "_on_InvBackBtn_press")
	$HUD/VBoxContainer/TFBtn.connect("pressed", self, "_on_TFBtn_press")
	$TFs/BackContainer/BackBtn.connect("pressed", self, "_on_TFBackBtn_press")

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		_on_ItemsBtn_press()

func _on_InvBackBtn_press():
	get_parent().get_node("Player").loading = false
	$HUD.visible = true
	$Inventory.visible = false

func _on_TFBackBtn_press():
	get_parent().get_node("Player").loading = false
	$HUD.visible = true
	$TFs.visible = false

func _on_ItemsBtn_press():
	get_parent().get_node("Player").loading = true
	$HUD.visible = false
	$Inventory.visible = true

func _on_TFBtn_press():
	get_parent().get_node("Player").loading = true
	$HUD.visible = false
	$TFs.visible = true
