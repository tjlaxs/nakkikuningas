extends GutTest

func test_assert_grid_center():
	assert_eq(
		Vector2i.ZERO,
		Grid.world_to_grid(Grid.grid_to_world(Vector2i.ZERO)),
		"Zero stays zero.")

func test_assert_world_center():
	assert_eq(
		Vector2i.ZERO,
		Grid.grid_to_world(Grid.world_to_grid(Vector2i.ZERO)),
		"Zero stays zero.")

func test_assert_grid_9_42():
	const p = Vector2i(9, 42)
	assert_eq(
		p,
		Grid.world_to_grid(Grid.grid_to_world(p)),
		"%s change from grid to world to grid should stay same." % [p])

func test_assert_world_16_48():
	const p = Vector2i(1, 3) * Grid.tile_size
	assert_eq(
		p,
		Grid.grid_to_world(Grid.world_to_grid(p)),
		"%s change from world to grid to world should stay same." % [p])
