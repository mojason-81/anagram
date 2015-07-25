def valid_addition?(input)
	@find_me = Word.find_by text: input
	if @find_me == nil
		raise Exception.new("Looks like that word is already in the list.")
	end
end

get '/words' do
  @words = Word.paginate(page: params[:page]).order(:text)
  erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

post '/words' do
	@word = params[:word]
	begin
		valid_addition?(@word)
		@word = Word.create(text: params[:text])
    redirect "/words/#{@word.id}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end


	#if File.read("public/assets/word_list.txt").include?(params [:text]) == true
   # @word = Word.create(text: params[:text])
   # redirect "/words/#{@word.id}"
  #else
  #  @error = "Sorry that's not a word."
  #  erb :"/words/new"
  #end
#end

get '/words/:id' do
	@word = Word.find(params[:id])
	@anagrams = Word.find_anagrams(@word.text)
	erb :"/words/show"
end

get '/words/:id/edit' do
	@word = Word.find(params[:id])
	erb :"/words/edit"
end

put '/words/:id' do
  @word = Word.find(params[:id])
  @word.text = params[:text]
  @word.save
  @anagrams = Word.find_anagrams(@word.text)
  erb :"/words/show"
end

delete '/words/:id' do
	Word.find(params[:id]).destroy
	redirect "/words"
end

#put '/words/:id' do
#	@word = Word.find(params[:id])
#	@word.text = params[:text]
#	@word.save
	#@word.update(params[:id], :text => params[:text])
	#@word.update_attributes(text: params[:text])
	#@anagrams = Word.find_anagrams(@word.text)
#	erb :"/words/show"
#end
