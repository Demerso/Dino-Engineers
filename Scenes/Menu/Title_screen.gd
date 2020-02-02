extends Control


func _on_PlayButton_pressed():
	$ButtonPress.play()
	get_tree().change_scene("res://Scenes/Menu/Game/Play.tscn")


func _on_Quit_pressed():
	$ButtonPress.play()
	get_tree().quit()


func _on_OptionsButton_pressed():
	$ButtonPress.play()
	get_tree().change_scene("res://Scenes/Menu/OptionsMenu.tscn")
