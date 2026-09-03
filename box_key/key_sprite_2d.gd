extends Area2D

@onready var key_sprite = $Sprite2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		print(GameState.has_key)
		if  event is InputEventMouseButton and event.button_index == 1 and event.pressed and not GameState.has_key:
			GameState.has_key = true
			key_sprite.visible = false
