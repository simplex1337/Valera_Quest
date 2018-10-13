# Valera_Quest

# Valera
	● HP 				- Здоровье
	● MP 				- Алкоголь
	● Happiness 		- Жизнерадостность
	● Cash 				- Деньги 
	● Fatigue 			- Усталость	
	------------------
	+ get {HP, MP, ..}
	+ get_full_stat
	- set
	+ dead?
	
	
# Event 
	● Deseript
	● Hash <field, baf>
	-------------------
	+ apply
	

# Engine
	● Valera
	● Event [field, baf]
	--------------------
	+ load_valera_state
	+ load_config
	+ save_valera_state
	
	
# Executor
	● Engine
	------------
	+ scan_event
