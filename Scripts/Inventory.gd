extends Control

class item:
	var item_name
	var item_description
	var item_type
	var item_effect

var item_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var item_TF_Spray = item.new()
	item_TF_Spray.item_name = "TF Spray"
	item_TF_Spray.item_description = "Spray on TFs to heal them. Heals 20 points of HP."
	item_TF_Spray.item_type = "healing"
	item_TF_Spray.item_effect = "Heals TF HP by 20 points."
	item_list += [item_TF_Spray]
	
	var item_TF_Bandage = item.new()
	item_TF_Bandage.item_name = "TF Bandage"
	item_TF_Bandage.item_description = "Use on TF to stop bleeding."
	item_TF_Bandage.item_type = "healing"
	item_TF_Bandage.item_effect = "Stops TF bleeding."
	item_list += [item_TF_Bandage]
	
	var item_TF_Dollars = item.new()
	item_TF_Dollars.item_name = "TF Dollars"
	item_TF_Dollars.item_description = "Use to add 100 TF Dollars to your account."
	item_TF_Dollars.item_type = "Misc"
	item_TF_Dollars.item_effect = "Adds 100 TF dollars to account."
	item_list += [item_TF_Dollars]
