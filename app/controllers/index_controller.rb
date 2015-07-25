def valid_input?(input)
	@find_me = Word.find_by text: input
	if @find_me == nil
		raise Exception.new("Sorry, looks like that word isn't in our list.")
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
	begin
		valid_input?(@word)
		redirect "/anagrams/#{@word}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end