extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed: float = 5.0
var y_pos_delta = 0
var start_pos

func _ready() -> void:
	start_pos = self.global_position

func _process(delta: float) -> void:
	y_pos_delta += speed * delta
	global_position.y = start_pos.y  + cos(y_pos_delta) * 2
	pass

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
