class Score
	def initialize
		@streak = 0
		@best_streak = 0
		@score = 0
		@high_score = 0
	end

	def sleep
		`sleep 1`
	end

	def calc_win (score)
		@streak += 1
		@best_streak += 1 if @streak > @best_streak
		@score += score
		@high_score = @score if @score > @high_score

		puts "You're winner! +#{@score}"
		sleep
	end

	def calc_loss
		@streak = 0
		@score = 0

		puts "You lose"
		sleep
	end

	def show_info
		puts ["Wins: #{@streak}", "Score: #{@score}", "Best Streak: #{@best_streak}", "High Score: #{@high_score}"]
	end

end
