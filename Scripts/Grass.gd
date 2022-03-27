extends Sprite

var anim = get_node("GrassAnimation").get_animation("Grass Animation")

func _ready():
	anim.set_loop(true)
	get_node("GrassAnimation").play("Grass Animation")
