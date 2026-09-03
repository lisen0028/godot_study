extends Area2D

@onready var sprite = $Sprite2D


func  _ready() -> void:
	refresh()
	GameState.door_opened_changed.connect(refresh)
	
func refresh():
	if GameState.door_opened:
		sprite.visible = false
	else:
		sprite.visible = true
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if GameState.has_key:
			GameState.has_key = false
			GameState.has_key_changed.emit()
			
			GameState.door_opened = true
			GameState.door_opened_changed.emit()
			
			get_tree().change_scene_to_file("res://room_2.tscn")
		else:
			print("你没有钥匙，找找吧") 
