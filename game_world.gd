extends Node2D
class_name World
var population:Array = []
var pop_size:int = 10
const GHOST = preload("res://ghost.tscn")
@export var time_elapsed = 0
var screen_sizeX
var screen_sizeY
var trialTime:int = 10 
var generation:int = 1
@onready var trial_t_ime: Label = $TrialTIme

func generate_population():
	for i in range(0,pop_size):
		var pos:Vector2 = Vector2(randf_range(0,screen_sizeX),randf_range(0,screen_sizeY))
		var newghost = GHOST.instantiate()
		
		newghost.r = randf()
		newghost.g = randf()
		newghost.b = randf()
		
		newghost.position = pos
		add_child(newghost)
		population.append(newghost)
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for i in range(pop_size):
		#var newGhost:DNA = GHOST.instantiate()
		#newGhost.position.x = randf_range(0,1152)
		#newGhost.position.y = randf_range(0,648.0)
		#population.append(newGhost)
		trial_t_ime.text = "Trial time: " + str(trialTime)
		screen_sizeX = get_viewport_rect().size.x
		screen_sizeY = get_viewport_rect().size.y
		generate_population()
		
		
			
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
