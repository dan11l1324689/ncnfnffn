extends KinematicBody2D
var on_airtime = 0
const Floor = Vector2 (0,-1)
var vert_move=0
var speed = 500
var accel=Vector2()
const GRAVITI=Vector2(0,908)
var jump_force =1300
func _input(event):
	print(event.as_text ())
 
func _process(delta):
	if Input.is_action_pressed ("UP") and is_on_floor():
		accel.y -= jump_force
	accel += GRAVITI*delta 
	var target_vel = 0
	target_vel =-int (Input.is_action_pressed("LEFT")) + int(Input.is_action_pressed("RIGHT"))
	on_airtime +=delta
	accel = move_and_slide(accel,Floor,50.0)
	if is_on_floor():
		on_airtime =  0
	var on_floor = on_airtime <0.1
	target_vel *= speed
	accel.x = lerp(accel.x,target_vel, 0.3)
	#accel.x+= speed if Input.is_action_pressed ("RIGHT") else 0
	#accel.x+= 1 if Input.is_action_pressed ("LEFT") else 0
	#vert_move =-300 if Input .is_action_pressed("UP") else vert_move + 9.6*delta
	#accel += GRAVITI
	#accel = move_and_slide(accel+Vector2 (0,vert_move),Vector2)
