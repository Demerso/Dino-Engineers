extends Control

const _char_selection : String = "res://Scenes/Menu/Char_Selection.tscn"
const _options_menu : String = "res://Scenes/Menu/OptionsMenu.tscn"

func _ready():
	if !MenuMusic.is_playing():
		MenuMusic.play()

func _on_Play_pressed():
	$ButtonPress.play()
	get_tree().change_scene(_char_selection)


func _on_Options_pressed():
	$ButtonPress.play()
	get_tree().change_scene(_options_menu)
	
func _on_Quit_pressed():
	$ButtonPress.play()
	get_tree().quit()
