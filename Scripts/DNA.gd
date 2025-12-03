extends Area2D
class_name DNA
var r:float = 0
var g:float = 0 
var b:float = 0
@onready var time_elapsed:float = 0
@onready var timer: Timer = $Timer
@export var dead_ghosts:int = 0



var is_dead:bool = false
@export var timeToDie:float = 0.0
@onready var fantasma_vista_frontal: Sprite2D = $FantasmaVistaFrontal
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		 	#is_dead = true
			#print("Dead at ",)
		
#func cronometrar():
	#timeToDie = Time.get_ticks_msec()
	#print("Contando")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ghost_color = Color(r,g,b)
	fantasma_vista_frontal.self_modulate = ghost_color

	
	
	
	pass # Replace with function body.
func die():
	if is_dead:
		return
	fantasma_vista_frontal.hide()
	collision_shape_2d.disabled
	print("Dead at: ",timeToDie)
	is_dead = true
	timeToDie = time_elapsed
	print("Time alive:",timeToDie)
	dead_ghosts +=1
	
	

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	if not is_dead:
		time_elapsed+= delta
	
		
		
 
#func _input(event: InputEvent) -> void:
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				#var mouse_pos = get_global_mouse_position()
				#var query:= PhysicsPointQueryParameters2D.new()
				#query.position = mouse_pos
				#query.collide_with_areas = true
				#query.collide_with_bodies = true
				#var result =  get_world_2d().direct_space_state.intersect_point(query)
				#for item in result:
					#if item in result:
						#if item.collision_shape_2d == self:
							#is_dead = true
				#fantasma_vista_frontal.hide()
				#collision_shape_2d.disabled
				#print("Dead at: ",timeToDie)
				
				


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			die()
