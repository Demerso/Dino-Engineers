extends Area2D

var winner = 0

func _on_Trophy_body_entered(body: Node) -> void:
	if body.filename == "res://Characters/Dino.tscn":
		if body.character == winner:
			get_tree().change_scene("res://Scenes/Menu/Title_screen.tscn")
