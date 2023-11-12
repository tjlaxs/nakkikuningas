class_name MovementAction
extends ActionWithDirection

func perform() -> void:
	var destination: Vector2i = entity.grid_position + offset
	
	var map_data: MapData = get_map_data()
	var destination_tile: Tile = map_data.get_tile(destination)
	if not destination or not destination_tile.is_walkable():
		print("not walkable tile")
		return
	if get_blocking_entity_at_destination():
		print("blocking entity")
		return
	entity.move(offset)
