extends GutTest

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/EntityDefinitionPlayer.tres")

func test_can_create_mapdata() -> void:
	var p: Entity = Entity.new(null, Vector2i.ZERO, player_definition)
	var md: MapData = MapData.new(5, 5, p)
	var tile: Tile = md.get_tile(Vector2i(3,3))
	assert_eq(tile.is_explored, false, "New tile should not be explored")
	assert_eq(tile.is_walkable(), false, "New tile should not be walkable")
	assert_eq(tile.is_transparent(), false, "New tile should not be transparent")
	
	# Cleanup
	p.free()
	for y in range(0, 5):
		for x in range(0, 5):
			md.tiles[y*5 + x].free()
