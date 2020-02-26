extends Area2D

const DINO_SCENE = "res://Scenes/Dinos/Dino.tscn"
const TITLE_SCREEN = "res://Scenes/Menu/Title_screen.tscn"

var winner = 0

func _on_Trophy_body_entered(body: Node) -> void:
	if body.filename == DINO_SCENE:
		if body.character == winner:
			get_tree().change_scene(TITLE_SCREEN)
