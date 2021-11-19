extends TileMap

onready var player = $Player
var tile_pos_infront_of_player

func _ready():
	pass
	
func _physics_process(delta):
	if player:
		var player_pos = player.global_position
		var tile_pos_player_is_on = world_to_map(player_pos)
		#Here we need to use face direction to determine where to put grid helper
		tile_pos_infront_of_player = tile_pos_player_is_on + player.face_direction
		$GridHelper.global_position = tile_pos_infront_of_player * 16 #tile size
		
func _input(event):
	if event.is_action_pressed("ui_select"):
		if self.get_cellv(tile_pos_infront_of_player) == CONSTANTS.GRAVEL_ID:
			self.set_cellv(tile_pos_infront_of_player, self.get_tileset().find_tile_by_name(CONSTANTS.EARTH_NAME))
		elif self.get_cellv(tile_pos_infront_of_player) == CONSTANTS.EARTH_ID:
			self.set_cellv(tile_pos_infront_of_player, self.get_tileset().find_tile_by_name(CONSTANTS.GRAVEL_NAME))
