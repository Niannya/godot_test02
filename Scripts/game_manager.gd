extends Node

@export var score = 0
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You get " + str(score) + " coins!"
	#print(score)
