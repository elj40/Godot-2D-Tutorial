extends Node2D

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()

func _physics_process(_delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered():
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered():
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()
	pass
	


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/Stage1.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
