extends KinematicBody2D

var vel = 300
var vel_base = 300
var vel_dash = 1500
var pre_tiro = preload("res://scenes/tiro.tscn")
var reload = 0
var tempo = 0.1
var impulso

var lanterna = false
var tempo_espera_dash_max = 2
var tempo_espera_dash = 0
var tempo_dash_max = 0.2
var tempo_dash = 0
var dashando = false

export(bool) var imobilizado

var vida = 100.0
var vida_max = 100.0
var empurrao = 100
var tempo_vida = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("anim").play("idle")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not imobilizado:
		look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("clickE"):
		atirar()
	
	if reload > 0:
		reload = reload - delta
	
	if not imobilizado:
		if Input.is_action_just_pressed("clickD") or Input.is_action_just_pressed("e"):
			lanterna = not lanterna
			atualizar_lanterna()
		
	get_node("luz").set_visible(lanterna)
	
	if vida<=(vida_max/2):
		if tempo_vida<=0:
			get_node("coracao").play()
			tempo_vida = 0.5 + 1*(vida/(vida_max/2))
		else:
			tempo_vida = tempo_vida - delta
	
	
	pass
	
	
func _physics_process(delta):
	if not imobilizado:
		if not dashando:
			if Input.is_action_just_pressed("dash") and tempo_espera_dash<=0:
				vel = vel_dash
				dashando = true
				tempo_dash = tempo_dash_max
			tempo_espera_dash = tempo_espera_dash - delta
		else:
			tempo_dash = tempo_dash - delta
			tempo_espera_dash = tempo_espera_dash_max
			
		if tempo_dash<=0 and dashando:
			vel = vel_base
			dashando = false
		
		
		
		if Input.is_action_pressed("cima"):
			if Input.is_action_pressed("esquerda") or Input.is_action_pressed("direita"):
				move_and_slide(Vector2(0, -sin(45)) * vel)
			else:
				move_and_slide(Vector2(0,-1) * vel)
		
		if Input.is_action_pressed("baixo"):
			if Input.is_action_pressed("esquerda") or Input.is_action_pressed("direita"):
				move_and_slide(Vector2(0, sin(45)) * vel)
			else:
				move_and_slide(Vector2(0,1) * vel)
			
		if Input.is_action_pressed("direita"):
			if Input.is_action_pressed("cima") or Input.is_action_pressed("baixo"):
				move_and_slide(Vector2(cos(45), 0) * vel)
			else:
				move_and_slide(Vector2(1,0) * vel)
			
		if Input.is_action_pressed("esquerda"):
			if Input.is_action_pressed("cima") or Input.is_action_pressed("baixo"):
				move_and_slide(Vector2(-cos(45), 0) * vel)
			else:
				move_and_slide(Vector2(-1,0) * vel)


func atirar():
	if not imobilizado:
		if reload <= 0:
			var tiro = pre_tiro.instance()
			tiro.set_global_position(get_node("mira").get_global_position())
			get_owner().add_child(tiro)
			tiro.set_rotation(get_rotation())
			get_node("atirar").play()
			reload = tempo


func _on_lanterna_body_entered(body):
	if lanterna:
		if body.is_in_group(game.INIMIGO):
			if body.has_method("na_luz"):
				body.na_luz()
				pass
	pass # Replace with function body.

func _on_lateral_body_exited(body):
	if body.is_in_group(game.INIMIGO):
		if body.has_method("no_escuro"):
			body.no_escuro()
			pass
	pass # Replace with function body.

func atualizar_lanterna():
	if lanterna:
		var i = 0
		while i < len(get_node("lanterna").get_overlapping_bodies()):
			if get_node("lanterna").get_overlapping_bodies()[i].has_method("na_luz"):
				get_node("lanterna").get_overlapping_bodies()[i].na_luz()
			i = i + 1
	else:
		var i = 0
		while i < len(get_node("lateral").get_overlapping_bodies()):
			if get_node("lateral").get_overlapping_bodies()[i].has_method("no_escuro"):
				get_node("lateral").get_overlapping_bodies()[i].no_escuro()
			i = i + 1
	pass

func dano_player(valor, posicao_inimigo):
	vida = vida - valor
	move_and_slide((get_global_position() - posicao_inimigo) * empurrao)
	get_node("anim").stop()
	get_node("anim").play("dano")
	
	if vida <= 0:
		game.deaths += 1
		game.save_game()
		get_tree().change_scene("res://title_screen/death/Death.tscn")
	
	pass

func add_vida(valor):
	vida = clamp(vida + valor, 0, vida_max)
	pass