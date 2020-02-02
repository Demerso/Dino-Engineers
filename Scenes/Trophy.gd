extends Area2D

var winner


func _on_Trophy_body_entered(body: Node) -> void:
	if body.character == winner:
		print("you win")
