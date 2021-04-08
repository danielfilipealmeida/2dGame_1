extends KinematicBody2D


var score : int = 0
var speed : int = 200
var jumpForce : int = 500
var gravity : int = 800

var vel : Vector2 = Vector2()
var grounded : bool = false

onready var sprite = $Sprite
onready var ui = get_node("/root/Game/CanvasLayer/UI")

func _ready():
	pass
	
func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false


func die():
	get_tree().reload_current_scene()
	
func collect_coin(value):
	score += value
	ui.set_score_text(score)
