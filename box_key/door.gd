extends Area2D

@onready var sprite = $Sprite2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if GameState.has_key:
			sprite.visible = false
		else:
			print("你没有钥匙，找找吧") 
