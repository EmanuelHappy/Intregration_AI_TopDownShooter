extends Control

var dictionary = dict_dialog.dict
var page = 0
var voice = AudioStreamPlayer.new()



func _ready():
	self.add_child(voice)
	voice.stream = load("res://samples/bunch_of_voices.ogg")
	voice.play(23.44)
	voice.set_volume_db(-6)
	$Game_Player/Options/Button1.grab_focus()

func _process(delta):
	if voice.get_playback_position() > 27.13:
		voice.play(23.44)
		
	if Input.is_action_pressed("direita") and ($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		$Game_Player/Options/Button2.grab_focus()
	if Input.is_action_pressed("esquerda") and ($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		$Game_Player/Options/Button1.grab_focus()


func _on_Terminal_ready():
	$Game_Player/Dialog/Terminal.set_bbcode(dictionary[page]["text"])
	$Game_Player/Dialog/Terminal.set_visible_characters(0)


func _on_Timer_timeout():
	$Game_Player/Dialog/Terminal.set_visible_characters($Game_Player/Dialog/Terminal.get_visible_characters()+1)
	if($Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count()):
		voice.stop()
		$Game_Player/Options/Button1/option1.set_visible_characters($Game_Player/Options/Button1/option1.get_visible_characters()+1)
		if(dictionary[page]["links"].size() > 1):
			$Game_Player/Options/Button2/option2.set_visible_characters($Game_Player/Options/Button2/option2.get_visible_characters()+1)
		
		
#Button 1 Action:

func _on_option1_ready():
	$Game_Player/Options/Button1/option1.set_bbcode(dictionary[page]["links"][0]["name"])
	$Game_Player/Options/Button1/option1.set_visible_characters(0)
		
func _on_Button1_pressed():
				
	if $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		if dictionary[page]["links"][0]["name"] == '...end':
			get_tree().change_scene("res://title_screen/TitleScreen.tscn")
		
		elif dictionary[page]["links"][0]["name"] != 'okay!':
			page  = dictionary[page]["links"][0]["pid"]
			page = int(page) - 1
			
			voice.play(23.44)
			
			$Game_Player/Dialog/Terminal.set_bbcode(dictionary[page]["text"])
			$Game_Player/Dialog/Terminal.set_visible_characters(0)
			
			$Game_Player/Options/Button1/option1.set_bbcode(dictionary[page]["links"][0]["name"])
			$Game_Player/Options/Button1/option1.set_visible_characters(0)
			
			$Game_Player/Options/Button2/option2.set_visible_characters(0)
			if(dictionary[page]["links"].size() > 1):
				$Game_Player/Options/Button2/option2.set_bbcode(dictionary[page]["links"][1]["name"])
			else:
				$Game_Player/Options/Button2.hide()
				
		else:
			get_tree().change_scene("res://scenes/tutorial/tutorial.tscn")

	else:
		$Game_Player/Dialog/Terminal.set_visible_characters($Game_Player/Dialog/Terminal.get_total_character_count())

# Button1 Style:

func _on_Button1_focus_entered():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("00ff3e"))
func _on_option1_mouse_entered():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("00ff3e"))
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("008519"))
	
func _on_option1_gui_input(event):
	if Input.is_action_pressed("clickE") and $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		_on_Button1_pressed()
		
func _on_Button1_focus_exited():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("008519"))
func _on_option1_mouse_exited():
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("008519"))


# Button 2 Action:

func _on_Button2_pressed():
	$Game_Player/Options/Button1.grab_focus()
	if $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		
		if dictionary[page]["links"][0]["name"] != 'okay!':
			page  = dictionary[page]["links"][1]["pid"]
			page = int(page) - 1
			
			voice.play(23.44)
			
			$Game_Player/Dialog/Terminal.set_bbcode(dictionary[page]["text"])
			$Game_Player/Dialog/Terminal.set_visible_characters(0)
			
			$Game_Player/Options/Button1/option1.set_bbcode(dictionary[page]["links"][0]["name"])
			$Game_Player/Options/Button1/option1.set_visible_characters(0)
			
			$Game_Player/Options/Button2/option2.set_visible_characters(0)
			if(dictionary[page]["links"].size() > 1):
				$Game_Player/Options/Button2/option2.set_bbcode(dictionary[page]["links"][1]["name"])
			else:
				$Game_Player/Options/Button2.hide()
				
		else:
			get_tree().change_scene("res://scenes/tutorial/tutorial.tscn")
				
	else:
		$Game_Player/Dialog/Terminal.set_visible_characters($Game_Player/Dialog/Terminal.get_total_character_count())
	
func _on_option2_ready():
	if(dictionary[page]["links"].size() > 1):
		$Game_Player/Options/Button2/option2.set_bbcode(dictionary[page]["links"][1]["name"])
		
	$Game_Player/Options/Button2/option2.set_visible_characters(0)
	
# Button 2 Style:

func _on_Button2_focus_entered():
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("00ff3e"))
func _on_option2_mouse_entered():
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("00ff3e"))
	$Game_Player/Options/Button1/option1.add_color_override("default_color", Color("008519"))
	
func _on_option2_gui_input(event):
	if Input.is_action_pressed("clickE") and $Game_Player/Dialog/Terminal.get_visible_characters() > $Game_Player/Dialog/Terminal.get_total_character_count():
		_on_Button2_pressed()
	
func _on_Button2_focus_exited():
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("008519"))
func _on_option2_mouse_exited():
	$Game_Player/Options/Button2/option2.add_color_override("default_color", Color("008519"))


