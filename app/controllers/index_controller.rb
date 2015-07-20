def three_letters?(input)
	if input.length == 3
		return true
	else
		return false
	end
end

def distinct_letters?(input)
	letter_array = input.chars
	unique_letters = letter_array.uniq
	if unique_letters.length < letter_array.length
		return false
	else
		return true
	end
end

def valid_input?(input)
	if input.length > 3
		raise Exception.new("Word must be less than or equal to 3
			characters.")
	elsif !distinct_letters?(input)
		raise Exception.new("Word must contain only unique letters")
	end
end

get '/' do
	erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	#instead of calling Word.find_anagrams could use:
		# sorted_word = @word.chars.sort.join
		# @anagrams = Word.where("letters=?", sorted_word)
	erb :show
end

post '/' do
	@word = params[:word]
	#begin
	#	valid_input?(@word)
	#	redirect "/anagrams/#{@word}"
	#rescue Exception => error
	#	@error = error.message
	#	erb :index
	#end
	redirect "/anagrams/#{@word}"
end