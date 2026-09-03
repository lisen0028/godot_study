extends Area2D

@onready var key_sprite = $Sprite2D

func _ready() -> void:
	refresh()
	#监听box的信号,变化时执行refresh方法：
	GameState.box_opened_changed.connect(refresh)
	#监听key信号
	GameState.key_taken_changed.connect(refresh)


#刷新钥匙visible状态
func refresh():
	if GameState.box_opened and not GameState.key_taken:
		key_sprite.visible = true
	else:
		key_sprite.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		print(GameState.has_key)
		if  event is InputEventMouseButton and event.button_index == 1 and event.pressed and not GameState.has_key:
			GameState.take_key()
