extends Control

const _title_screen : String = "res://Scenes/Menu/Title_screen/Title_screen.tscn"

func _on_TextureButton_pressed():
	$ButtonPress.play()
	get_tree().change_scene(_title_screen)

func _on_masterVolSlider_value_changed(value):
	if(value == 40):
		AudioServer.set_bus_volume_db(0,0)
	AudioServer.set_bus_volume_db(0,value-80)


func _on_BMGSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1,value-80)


func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(2,value-80)
	$ButtonPress.play()
