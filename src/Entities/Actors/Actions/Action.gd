class_name Action
extends RefCounted

var entity: Entity

func _init(ent: Entity) -> void:
	self.entity = ent

func perform() -> void:
	pass

func get_map_data() -> MapData:
	return entity.map_data
