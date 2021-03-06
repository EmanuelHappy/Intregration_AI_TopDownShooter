extends Control

var dictionary = {"tutorial2":"W A S D!",
				  "tutorial3":"CLICK!", 
				  "tutorial4.1":"01010011 01010100 01001111 01010000", 
				  "tutorial4.2":"SPACE!", 
				  "tutorial5.1":"What's happening?",
				  "tutorial5.2":"Remember the RIGHT click.",
				  "level2":"Stay DETERMINED!"}
var key = dict_dialog.key
var voice = AudioStreamPlayer.new()
var character = 0

func _ready():
	key = dict_dialog.key
	
	self.add_child(voice)
	
	if key ==  "tutorial4.1":
		character = 1
		$Game_Player/Dialog/Terminal.add_color_override("default_color", Color("ff0000"))
		voice.stream = load("res://samples/diferent_voices.ogg")
		voice.play(15.50)
		
	elif key ==  "tutorial5.2":
		character = 2
		$Game_Player/Dialog/Terminal.add_color_override("default_color", Color("009999"))
		voice.stream = load("res://samples/diferent_voices.ogg")
		voice.play(5.80)
		
	else:
		voice.stream = load("res://samples/bunch_of_voices.ogg")
		voice.play(rand_range(0.0, 8.86))
		voice.set_volume_db(-6)
	
	$Game_Player/Options/Button1.grab_focus()

func _process(delta):
	if character == 0:
		if voice.get_playback_position() > 8.86:
			voice.play(rand_range(0.0, 8.86))
			
	if character == 1:
		if voice.get_playback_position() > 18.86:
			voice.play(15.50)
			
	if character == 2:
		if voice.get_playback_position() > 9.86:
			voice.play(5.80)
		
	if Input.is_action_pressed("direita") and ($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		$Game_Player/Options/Button2.grab_focus()
	if Input.is_action_pressed("esquerda") and ($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		$Game_Player/Options/Button1.grab_focus()


func _on_Terminal_ready():
	$Game_Player/Dialog/Terminal.set_bbcode(dictionary[key])
	$Game_Player/Dialog/Terminal.set_visible_characters(0)


func _on_Timer_timeout():
	$Game_Player/Dialog/Terminal.set_visible_characters($Game_Player/Dialog/Terminal.get_visible_characters()+1)
	if($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		voice.stop()
		$Game_Player/Options/Button1/option1.set_visible_characters($Game_Player/Options/Button1/option1.get_visible_characters()+1)
		
		
#Button 1 Action:

func _on_option1_ready():
	$Game_Player/Options/Button1/option1.set_bbcode("...")
	$Game_Player/Options/Button1/option1.set_visible_characters(0)
		
func _on_Button1_pressed():
				
	if $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		
		if key == "tutorial2":
			get_tree().change_scene("res://scenes/tutorial/tutorial2.tscn")
		
		if key == "tutorial3":
			get_tree().change_scene("res://scenes/tutorial/tutorial3.tscn")	
		
		if key == "tutorial4.1" or key == "tutorial4.2":
			get_tree().change_scene("res://scenes/tutorial/tutorial4.tscn")	

		if key == "tutorial5.1" or key == "tutorial5.2":
			get_tree().change_scene("res://scenes/tutorial/tutorial5.tscn")		
		
		if key == "level2":
			get_tree().change_scene("res://scenes/death/Death.tscn")		
			

	else:
		$Game_Player/Dialog/Terminal.set_visible_characters($Game_Player/Dialog/Terminal.get_total_character_count())


# Button1 Style:

func _on_Button1_focus_entered():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("00ff3e"))
func _on_option1_mouse_entered():
	$Game_Player/Options/Button1.grab_focus()
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("00ff3e"))
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("008519"))
	
func _on_option1_gui_input(event):
	if Input.is_action_pressed("clickE") and $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		_on_Button1_pressed()
		
func _on_Button1_focus_exited():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("008519"))
func _on_option1_mouse_exited():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("008519"))


	

