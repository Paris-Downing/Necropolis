extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 20
const FRICTION = 500

var velocity = Vector2.ZERO
var face_direction = Vector2(0, 1)
var input_vector

onready var player = get_parent().get_node("Player")
onready var farm = get_parent()
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
#var input_vector = Vector2(0, 1)


#player.input_vector is a Vector2 with the x and y coordinates of player
#tile_pos_player_is_on does world_to_map(player_pos) which returns a Vector2 with the player's position
func _physics_process(delta):
	print("inside func")
	
	print("inside if")
#		var player_pos = player.global_position
	var tile_pos_player_is_on = farm.tile_pos_player_is_on #type Vector2 that has player's x/y coordinates
		#tile_pos_player_is_on = tile_pos_player_is_on.normalized()
	print("player position ", tile_pos_player_is_on)
#	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
#	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("test_up");
#	input_vector = input_vector.normalized();
	
#	if input_vector != Vector2.ZERO:
#		face_direction = tile_pos_player_is_on 
	animationTree.set("parameters/Idle/blend_position", tile_pos_player_is_on)
	animationTree.set("parameters/Run/blend_position", tile_pos_player_is_on)
	animationState.travel("Run")
	velocity = velocity.move_toward(tile_pos_player_is_on * MAX_SPEED, ACCELERATION * delta)
#	else:
#		animationState.travel("Idle")
#		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
