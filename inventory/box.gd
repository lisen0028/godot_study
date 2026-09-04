extends Area2D

@onready var sprite2 = $Sprite2D  #@onready 表示该节点准备好后获取
@export var object_id = "room1_box" #@export 将后续的属性标记为导出属性（可以在检查器面板中编辑并保存至磁盘）

@onready var item_scene = preload(
"res://item_view.tscn"
)

var openBox = preload("res://R.png")
var closebox = preload("res://OIP.webp")

func _ready() -> void:
	refresh()
	#监听box的信号,变化时执行refresh方法：
	GameState.box_opened_changed.connect(_on_box_changed)
	
func _on_box_changed(changed_id):
	if changed_id == object_id:
		refresh()

func refresh():
	if GameState.get_object_state(object_id,"opened"):
		sprite2.texture = openBox
	else:
		sprite2.texture = closebox
		
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if  event is InputEventMouseButton and event.button_index == 1 and event.pressed:
			GameState.toggle_box(object_id)
			
			var content = GameState.get_object_state(
			object_id,
			"content"
			)


			var taken = GameState.get_object_state(
				object_id,
				"content_taken"
			)


			if content != null and not taken:
				spawn_item(content)

func spawn_item(content):

	#实例化该场景的节点架构。触发子场景的实例化。在根节点上触发
	var item = item_scene.instantiate()
	
	add_child(item)#向当前节点树添加该节点

	item.show_item(content,object_id)#调用该节点方法
