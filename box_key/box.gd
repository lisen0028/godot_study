extends Area2D

@onready var sprite2 = $Sprite2D  #@onready 表示该节点准备好后获取
@onready var key_sprite2 = get_node("../key/Sprite2D")

var isOpened = false
var openBox = preload("res://R.png")
var closebox = preload("res://OIP.webp")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(event) # Replace with function body.
	if  event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if isOpened:
			sprite2.texture = closebox
			key_sprite2.visible = false
			isOpened = false
		else :
			sprite2.texture = openBox
			isOpened = true
			if not GameState.has_key:
				key_sprite2.visible = true
