extends Area2D

@onready var sprite = $Sprite2D
@onready var collisionShape2D = $CollisionShape2D


func  _ready() -> void:
	refresh()
	GameState.door_opened_changed.connect(refresh)
	
func refresh():
	if GameState.door_opened:
		sprite.visible = false
		collisionShape2D.disabled = true
	else:
		sprite.visible = true
		collisionShape2D.disabled = false
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if GameState.has_key:
			if not GameState.door_opened:
				GameState.open_door()
		else:
			print("你没有钥匙，找找吧") 
