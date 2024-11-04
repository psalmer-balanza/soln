extends Control

@onready var content = $container/VBoxContainer/Content
@onready var c1:Button = $"container/VBoxContainer/Answers/a/Choice 1"
@onready var c2:Button = $"container/VBoxContainer/Answers/b/Choice 2"
@onready var c3:Button = $"container/VBoxContainer/Answers/c/Choice 3"
@onready var c4:Button = $"container/VBoxContainer/Answers/d/Choice 4"
@onready var mc_questions
@onready var mc_choice_ids
var index
var correct_answer
var answer
var rng = RandomNumberGenerator.new()
var question

func _ready():
	# dont forget to put true back to Global.is_online
	if Global.is_online:
		QuestionsLoader.connect("questions_loaded", _on_questions_loaded)
		if DialogueState.current_quest == "face_the_snake":
			QuestionsLoader.get_snekkers_questions()
		else:
			print("crab questions")
			QuestionsLoader.get_crab_questions()
	else:
		# else get OFFLINE VALUES FOR QUIZ
		print("Current quest is: ", DialogueState.current_quest)
		if DialogueState.current_quest == "face_the_snake":
			mc_questions = [
			["What is 1/4 + 1/4?", "1/2", "3/4", "1", "1/8", "1/2"],
			["What is 1/3 + 1/3?", "1/2", "2/3", "3/3", "4/3", "2/3"],
			["What is 1/5 + 2/5?", "1/5", "3/5", "4/5", "1", "3/5"],
			["What is 2/6 + 1/6?", "3/6", "4/6", "1/6", "1/2", "1/2"],
			["What is 3/8 + 1/8?", "4/8", "5/8", "6/8", "1/2", "1/2"],
			["What is 1/2 + 2/4?", "3/4", "1", "1/2", "2/4", "1"],
			["What is 1/3 + 2/3?", "1/3", "1", "2", "3/3", "1"],
			["What is 5/12 + 1/4?", "1/3", "3/4", "2/3", "8/12", "2/3"],
			["What is 3/10 + 4/10?", "1/10", "1/2", "7/10", "8/10", "7/10"],
			["What is 1/6 + 1/3?", "1/2", "2/6", "3/6", "4/6", "1/2"]
			]
		
		else:
			print("Current quest is: ", DialogueState.current_quest)
			mc_questions = [
			["What is 1/2 - 1/4?", "1/2", "1/4", "1/8", "3/4", "1/4"],
			["What is 2/3 - 1/3?", "1/3", "2/3", "1/2", "1", "1/3"],
			["What is 4/5 - 1/5?", "2/5", "3/5", "1/5", "4/5", "3/5"],
			["What is 2/3 - 1/6?", "1/6", "1/2", "1/3", "5/6", "1/2"],
			["What is 5/8 - 1/8?", "4/8", "3/8", "5/8", "1/2", "1/2"],
			["What is 2/2 - 1/2?", "1/2", "1/4", "3/4", "2/4", "1/2"],
			["What is 5/6 - 1/3?", "1/2", "1/3", "2/3", "5/6", "1/2"],
			["What is 3/4 - 1/4?", "2/4", "1/4", "3/4", "1", "1/2"],
			["What is 7/10 - 3/10?", "1/5", "4/10", "7/10", "1/2", "4/10"],
			["What is 3/4 - 1/2?", "1/4", "1/2", "1/3", "2/4", "1/"]
			]
			
func _on_questions_loaded():
	if DialogueState.current_quest == "face_the_snake":
		mc_questions = QuestionsLoader.snekkers_questions
		mc_choice_ids = QuestionsLoader.snekkers_choice_ids
	else:
		mc_questions = QuestionsLoader.crab_questions
		mc_choice_ids = QuestionsLoader.crab_choice_ids
	# score = questions.size() MINUS no_of_wrong_attempts
	Global.total_score = mc_questions.size()

# can change for better randomness using shuffle bags
func _choose_question() -> int:
	print(mc_questions)
	return RandomNumberGenerator.new().randi_range(0, mc_questions.size()) - 1

func _on_choice_1_pressed() -> void:
	# post statistic if online
	postStatistics(1)
	answer = c1.text
	_check_answer()
	

func _on_choice_2_pressed() -> void:
	# post statistic if online
	postStatistics(2)
	answer = c2.text
	_check_answer()
	
func _on_choice_3_pressed() -> void:
	# post statistic if online
	postStatistics(3)
	answer = c3.text
	_check_answer()
	
func _on_choice_4_pressed() -> void:
	# post statistic if online
	postStatistics(4)
	answer = c4.text
	_check_answer()
	
func _check_answer():
	if answer == correct_answer:
		Global.Snekker_HP -= 10
		Global.Giant_Enemy_Crab_HP -= 10
		visible=false
		#This current quest changer should be wherever the final question/end of quiz is
		
		mc_questions.remove_at(index)
		if Global.is_online:
			mc_choice_ids.remove_at(index)
	else:
		print("Incorrect answer")
		if Global.is_online:
			Global.total_score -= 1
	Global.Snekker_question = false
	Global.Giant_Enemy_Crab_question = false

func _on_draw() -> void:
	index = _choose_question()
	print("Questions: ")
	print(mc_questions)
	print("Choice IDs")
	print(mc_choice_ids)
	question = mc_questions[index]
	content.text = question[0]
	c1.text = question[1]
	c2.text = question[2]
	c3.text = question[3]
	c4.text = question[4]
	correct_answer = question[5]
	
func postStatistics(choice_index):
	if Global.is_online:
		if DialogueState.current_quest == "face_the_snake":
			if choice_index == 1:
				Statistics.postQuizResponse(PlayerState.classroom_id, 5, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][0]))
			elif choice_index == 2:
				Statistics.postQuizResponse(PlayerState.classroom_id, 5, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][1]))
			elif choice_index == 3:
				Statistics.postQuizResponse(PlayerState.classroom_id, 5, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][2]))
			elif choice_index == 4:
				Statistics.postQuizResponse(PlayerState.classroom_id, 5, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][3]))
		else:
			if choice_index == 1:
				Statistics.postQuizResponse(PlayerState.classroom_id, 11, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][0]))
			elif choice_index == 2:
				Statistics.postQuizResponse(PlayerState.classroom_id, 11, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][1]))
			elif choice_index == 3:
				Statistics.postQuizResponse(PlayerState.classroom_id, 11, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][2]))
			elif choice_index == 4:
				Statistics.postQuizResponse(PlayerState.classroom_id, 11, int(mc_questions[index][6]), PlayerState.student_id, int(mc_choice_ids[index][3]))	
