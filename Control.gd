extends Control

func _ready():
	pass

func _process(delta):
	$Second.text = str(Time.second)
	$Minute.text = str(Time.minute)
	$Hour.text = str(Time.hour)
