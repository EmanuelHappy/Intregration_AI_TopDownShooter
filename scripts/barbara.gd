extends KinematicBody2D

var vel = 400
var raio = 600
var esperando = false
var destino = Vector2()
var tempo_espera = 1
var tempo = 0

var pre_spawn_vida = preload("res://scenes/vida.tscn")

var vida = 40
var dano = 10

var death = 0

export var ativo = true
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(game.INIMIGO)
	get_node("anim").play("idle")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if vida <= 0:
		if death == 0:
			game.inimigos_mortos += 1
			death = 1
		
		var spawn_vida = pre_spawn_vida.instance()
		spawn_vida.set_global_position(get_global_position())
		game.get_main().add_child(spawn_vida)
		set_process(false)
		set_physics_process(false)
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		remove_from_group(game.INIMIGO)
		get_node("anim").play("morrer")
		
	#ESPERAR UM POUCO QUANDO CHEGAR NO DESTINO
	if get_global_position().distance_to(destino) <= 20:
		esperando = true
	else:
		esperando = false
	if esperando:
		tempo = tempo - delta
	if tempo <= 0:
		destino = random_point(get_global_position(), raio)
		get_node("RayCast2D").look_at(destino)
		get_node("RayCast2D").force_raycast_update()
		if (not get_node("RayCast2D").is_colliding()):
			look_at(destino)
			tempo = tempo_espera

func _physics_process(delta):
	if vida > 0 and ativo:
		#TOCAR EM ALGUMA COISA
		if get_slide_count() > 0:
			esperando = false
			tempo = 0
		if not esperando:
			move_and_slide((get_node("frente").get_global_position() - get_global_position()) * vel)
	pass

func dano(valor):
	vida = vida - valor
	get_node("anim").stop()
	get_node("anim").play("dano")
	pass

func random_point(centro, raio):
	var x = rand_range(centro.x - raio, centro.x + raio)
	var y = rand_range(centro.y - raio, centro.y + raio)
	if(Vector2(x, y).distance_to(centro) > raio):
		return random_point(centro, raio)
	else:
		return Vector2(x, y)
	pass