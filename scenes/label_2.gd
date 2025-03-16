extends Label

@onready var label: Label = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Cold Cage Evil Shark Boss"
