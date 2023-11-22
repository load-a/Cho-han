def border (how_many = 1)
	how_many.times do
		puts "_______________________"
	end
end

def spacer (how_many = 1)
	how_many.times do
		puts ""
	end
end

def title
	puts "--- 丁半ゲーム ---"
	puts "-- CHO-HAN GAME --"
end

def get_prediction
	puts "What's your prediction?"
	gets.strip.downcase
end

def validate (answer)
	return :odd if HAN.include? answer
	return :even if CHO.include? answer
	return answer.to_i if RANGE.include? answer.to_i
	return :quit if QUIT.include? answer
	:invalid
end

def try_again
	spacer
	puts "Valid answers: Cho (c, even, e, etc.) / Han (h, odd, o, etc.)" 
	puts "  Any number between 2 and 12 / Quit (q, done, stop, etc.)"
	spacer
end

def roll_dice
	[(rand(6) + 1), (rand(6) + 1)]
end

def play_cutscene (roll, guess)
	puts "You guessed: #{guess}"
	puts "rolling..."
	`sleep 1`
	puts "#{roll[0]} #{roll[1]} -- #{roll.sum.even? ? "CHO 丁" : "HAN 半"}!"
	`sleep 1`
end

def score_results (roll, guess)
	if guess == :odd && roll.sum.odd?
		5
	elsif guess == :even && roll.sum.even?
		6
	elsif guess == roll.sum
		guess = "#{guess}".to_sym
		6 + SCORE_TABLE[guess]
	else
		0
	end
end

def goodbye
	spacer
	puts "遊んだありがとう！"
	puts "Thanks for playing!"
end
