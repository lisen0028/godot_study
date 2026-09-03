extends Area2D


@onready var sprite2 = $Sprite2D  #@onready 表示该节点准备好后获取


var openBox = preload("res://R.png")
var closebox = preload("res://OIP.webp")

func _ready() -> void:
	refresh()
	#监听box的信号,变化时执行refresh方法：
	GameState.box_opened_changed.connect(refresh)
	
func refresh():
	if GameState.box_opened:
		sprite2.texture = openBox
	else:
		sprite2.texture = closebox
		
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(event) # Replace with function body.
	if  event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if not GameState.box_opened:
			GameState.open_box()
			
