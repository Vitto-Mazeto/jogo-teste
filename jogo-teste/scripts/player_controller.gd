extends KinematicBody2D

export var speed : int = 400 #variável da velocidade, o export coloca no menu
export var jump_speed : int = -200 #velocidade do pulo
export var gravity : int = 200 #gravidade
var velocity = Vector2()

onready var sprite = get_node("Sprite")

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y += jump_speed
	
	#gravity 
	velocity.y += gravity * delta 
	velocity = move_and_slide(velocity, Vector2.UP)
	

		


func _physics_process(delta): # executa tantas vezes por segundo
	get_input(delta)

