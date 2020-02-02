extends Control

func _on_TextureButton_pressed():
	$ButtonPress.play()
	get_tree().change_scene("res://Scenes/Menu/Title_screen.tscn")
