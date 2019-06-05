extends Node

var dict =  [
    {
      "text": "Wake up... please... just wake up...",
      "links": [
        {
          "name": "Uh?",
          "link": "Uh?",
          "pid": "2"
        },
        {
          "name": "...",
          "link": "...",
          "pid": "3"
        }
      ],
      "name": "Start",
      "pid": "1",
      "position": {
        "x": "572",
        "y": "0"
      }
    },
    {
      "text": "Oh God... I'm so glad that you are alive...",
      "links": [
        {
          "name": "Who are you?!",
          "link": "Who are you?!",
          "pid": "5"
        },
        {
          "name": "...where am I?",
          "link": "...where am I?",
          "pid": "6"
        }
      ],
      "name": "Uh?",
      "pid": "2",
      "position": {
        "x": "456",
        "y": "120"
      }
    },
    {
      "text": "Hello, are you there?",
      "links": [
        {
          "name": "Hello?",
          "link": "Hello?",
          "pid": "4"
        },
        {
          "name": "....",
          "link": "....",
          "pid": "7"
        }
      ],
      "name": "...",
      "pid": "3",
      "position": {
        "x": "683",
        "y": "121"
      }
    },
    {
      "text": "Oh God... I'm so glad that you are alive...",
      "links": [
        {
          "name": "Who are you?!",
          "link": "Who are you?!",
          "pid": "5"
        },
        {
          "name": "...where am I?",
          "link": "...where am I?",
          "pid": "6"
        }
      ],
      "name": "Hello?",
      "pid": "4",
      "position": {
        "x": "449",
        "y": "241"
      }
    },
    {
      "text": "You can't remember your own father?",
      "links": [
        {
          "name": "...father?",
          "link": "...father?",
          "pid": "8"
        },
        {
          "name": "Oh... it's kind of dark in my mind, but yeah... you are my father",
          "link": "Oh... it's kind of dark in my mind, but yeah... you are my father",
          "pid": "9"
        }
      ],
      "name": "Who are you?!",
      "pid": "5",
      "position": {
        "x": "330",
        "y": "369"
      }
    },
    {
      "text": "You don't remember this place?",
      "links": [
        {
          "name": "no...",
          "link": "no...",
          "pid": "14"
        },
        {
          "name": "I... I guess I know what place is that...",
          "link": "I... I guess I know what place is that...",
          "pid": "15"
        }
      ],
      "name": "...where am I?",
      "pid": "6",
      "position": {
        "x": "570",
        "y": "374"
      }
    },
    {
      "text": "Oh no... please, answer something if you are there!",
      "links": [
        {
          "name": "help!",
          "link": "help!",
          "pid": "12"
        },
        {
          "name": ".....",
          "link": ".....",
          "pid": "13"
        }
      ],
      "name": "....",
      "pid": "7",
      "position": {
        "x": "904",
        "y": "222"
      }
    },
    {
      "text": "Your brother... the Queen... your mom... even Neeko... You really forget about everything?",
      "links": [
        {
          "name": "I... I don't know what you're talking about...",
          "link": "I... I don't know what you're talking about...",
          "pid": "10"
        }
      ],
      "name": "...father?",
      "pid": "8",
      "position": {
        "x": "150",
        "y": "527"
      }
    },
    {
      "text": "Great! At least you don't loss your entire memory. But for now, you just have to know that I'm your father and that the people how you care about are in danger.",
      "links": [
        {
          "name": "Oh no... what can I do?",
          "link": "Oh no... what can I do?",
          "pid": "17"
        },
        {
          "name": "Where are they?",
          "link": "Where are they?",
          "pid": "18"
        }
      ],
      "name": "Oh... it's kind of dark in my mind, but yeah... you are my father",
      "pid": "9",
      "position": {
        "x": "455",
        "y": "695"
      }
    },
    {
      "text": "It doesn't matter now, they are in danger and they need you.",
      "links": [
        {
          "name": "but....",
          "link": "but....",
          "pid": "11"
        }
      ],
      "name": "I... I don't know what you're talking about...",
      "pid": "10",
      "position": {
        "x": "96",
        "y": "657"
      }
    },
    {
      "text": "Take this and go outside, you will remember about everything.",
      "links": [
        {
          "name": "okay!",
          "link": "okay!",
          "pid": "19"
        }
      ],
      "name": "but....",
      "pid": "11",
      "position": {
        "x": "71",
        "y": "803"
      }
    },
    {
      "text": "Oh, that's okay, that's okay, don't worry, it was just an nightmare...",
      "links": [
        {
          "name": "Who are you?!",
          "link": "Who are you?!",
          "pid": "5"
        },
        {
          "name": "...where am I?",
          "link": "...where am I?",
          "pid": "6"
        }
      ],
      "name": "help!",
      "pid": "12",
      "position": {
        "x": "762",
        "y": "371"
      }
    },
    {
      "text": "Didn't work again... uffff.... I will have to restart all over!",
      "links": [
        {
          "name": "...end",
          "link": "...end"
        }
      ],
      "name": ".....",
      "pid": "13",
      "position": {
        "x": "1190",
        "y": "350"
      }
    },
    {
      "text": "Do you know who I am?",
      "links": [
        {
          "name": "no....",
          "link": "no....",
          "pid": "16"
        }
      ],
      "name": "no...",
      "pid": "14",
      "position": {
        "x": "535",
        "y": "532"
      }
    },
    {
      "text": "Great! At least you don't loss your entire memory. But for now, you just have to know that I'm your father and that the people how you care about are in danger.",
      "links": [
        {
          "name": "Oh no... what can I do?",
          "link": "Oh no... what can I do?",
          "pid": "17"
        },
        {
          "name": "Where are they?",
          "link": "Where are they?",
          "pid": "18"
        }
      ],
      "name": "I... I guess I know what place is that...",
      "pid": "15",
      "position": {
        "x": "753",
        "y": "539"
      }
    },
    {
      "text": "You can't remember your own father?",
      "links": [
        {
          "name": "...father?",
          "link": "...father?",
          "pid": "8"
        },
        {
          "name": "Oh... it's kind of dark in my mind, but yeah... you are my father",
          "link": "Oh... it's kind of dark in my mind, but yeah... you are my father",
          "pid": "9"
        }
      ],
      "name": "no....",
      "pid": "16",
      "position": {
        "x": "332",
        "y": "530"
      }
    },
    {
      "text": "For now, you have to learn again how to fight, here, take this... it's too dangerous to go alone!",
      "links": [
        {
          "name": "okay!",
          "link": "okay!",
          "pid": "19"
        }
      ],
      "name": "Oh no... what can I do?",
      "pid": "17",
      "position": {
        "x": "915",
        "y": "849"
      }
    },
    {
      "text": "Outside of this lab.\nFor now, you have to learn again how to fight, here, take this... it's too dangerous to go alone!",
      "links": [
        {
          "name": "okay!",
          "link": "okay!",
          "pid": "19"
        }
      ],
      "name": "Where are they?",
      "pid": "18",
      "position": {
        "x": "566",
        "y": "870"
      }
    },
    {
      "text": "END.",
      "name": "okay!",
      "pid": "19",
      "position": {
        "x": "746",
        "y": "959"
      }
    },
    {
      "text": "END",
      "name": "end",
      "pid": "20",
      "position": {
        "x": "1267",
        "y": "502"
      }
    }
  ]
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass