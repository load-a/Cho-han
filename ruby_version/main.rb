#______________________________________________
# Cho-Han (version 1.0.0)
#______________________________________________
#______________________________________________
# - Program Description -
# This program plays a game of Cho-han
#______________________________________________
# - Program Specifications - 
#	Input: 		Standard In
#	Output:	Standard Out
#______________________________________________
# - Requirements -
require './constants.rb'
require './score_class.rb'
require './methods.rb'
#______________________________________________
#______________________________________________
score = Score.new

title

loop do
	score.show_info
	border

	guess = validate(get_prediction)
	break if guess == :quit
	next try_again if guess == :invalid

	roll = roll_dice
	spacer

	play_cutscene(roll, guess)

	result = score_results(roll, guess)
	if result > 0
		score.calc_win(result)
	else
		score.calc_loss
	end
	spacer
	border
end

goodbye

#_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
# * Wish List * 
# - multiple players in a session (including cpu players)
# - high-score records (in a csv file probably?)
# - betting mechanic (as apposed to high-score play)
# - configuration menu
# - I want this to be a one-screen program like nano but I can't find how to do that ;-;
