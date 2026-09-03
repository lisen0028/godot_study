extends Area2D

var isOpened = false
@onready var sprite2 = $Sprite2D  #@onready 表示该节点准备好后获取
var openBox = preload("res://R.png")
var closebox = preload("res://OIP.webp")
# Called when the node enters the scene tree for the first time.
func _ready() -> void: # node初始化方法
	print("Box准备好了") 
	print(sprite2) 
	print(sprite2 == null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: #游戏运行期间会不断执行。
	pass 


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(event) # Replace with function body.
	if  event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if isOpened:
			sprite2.texture = closebox
			isOpened = false
		else :
			sprite2.texture = openBox
			isOpened = true
			
		
