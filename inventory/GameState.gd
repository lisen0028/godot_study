extends Node

#它代表了一个 Object 实例的信号
#信号允许所有已连接的 Callable（以及它们各自所属的对象）去监听并响应事件，而无需彼此之间直接引用。
signal box_opened_changed(object_id) # box状态变化信号
signal content_taken_changed(object_id) #容器内物品变化信号
signal door_opened_changed # door状态变化信号

var player

var objects = {
	"room1_box":{
		"opened" :false,
		"content" : "key",
		"content_taken" :false
	},
	"room1_door":{
		"opened" :false
	}
}

func get_object_state(object_id,key):
	if not objects.has(object_id):
		print("不存在对象:",object_id)
		return null

	return objects[object_id][key]

func set_object_state(object_id,key,val):
	objects[object_id][key] = val

func take_content(object_id):
	
	var content = get_object_state(
		object_id,
		"content")
	
	if content == null:
		return
	
	var taken = get_object_state(
		object_id,
		"content_taken"
	)

	if taken:
		return

	# 玩家获得物品
	player.add_item(content)
	set_object_state(object_id,"content_taken",true)
	# 通知
	content_taken_changed.emit(object_id)
	
func open_door(object_id):
	var door_opened = get_object_state(
		object_id,
		"opened"
	)
	if door_opened:
			return

	if not player.has_item("key"):
		print("你没有钥匙，找找吧") 
	else:
		player.remove_item("key")
		set_object_state(object_id,"opened",true)
		door_opened_changed.emit()
		SceneManager.change_scene("res://room_2.tscn")

func toggle_box(object_id):
	var opened = get_object_state(object_id,"opened")
	set_object_state(object_id,"opened",not opened)
	box_opened_changed.emit(object_id)
