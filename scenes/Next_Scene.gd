extends Area2D

export(String, FILE, "*.tscn") var target_state
func _ready():
	pass # Replace with function body.



func _on_Next_Scene_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene(target_state)
