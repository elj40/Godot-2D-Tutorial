extends KinematicBody2D

var velocity = Vector2()
const move_speed = 3000
const jump_speed = -200
const gravity = 300

const cherry = preload("res://scenes/Cherry.tscn")

var is_dead = false;
func _physics_process(delta):
	if is_dead:
		return
	
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_speed * delta
		$AnimatedSprite.set_flip_h( false )
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -move_speed * delta
		$AnimatedSprite.set_flip_h( true )
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	elif is_on_floor():
		$AnimatedSprite.play("Idle")
		
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite.play("Run")		
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite.play("Run")
	
	if velocity.y < 0:
		$AnimatedSprite.play("Jump")
	elif velocity.y>0:
		$AnimatedSprite.play("Fall")
	
	if Input.is_action_just_pressed("ui_focus_next"):
		var c = cherry.instance()
		get_parent().add_child(c)
		c.position = $Position2D.global_position
		c.set_cherry_direction($Position2D.position.x)
		
	velocity.y += gravity * delta		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
	

	velocity = move_and_slide(velocity, Vector2.UP)
	

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("Die")
	$CollisionShape2D.set_deferred("disabled", true)
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/Menu.tscn")
