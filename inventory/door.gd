extends Area2D

@onready var sprite = $Sprite2D
@onready var collisionShape2D = $CollisionShape2D
@export var object_id = "room1_door"

func  _ready() -> void:
	refresh()
	GameState.door_opened_changed.connect(refresh)
	
func refresh():
	if GameState.get_object_state(object_id,"opened"):
		sprite.visible = false
		collisionShape2D.disabled = true
	else:
		sprite.visible = true
		collisionShape2D.disabled = false
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
			GameState.open_door(object_id)
