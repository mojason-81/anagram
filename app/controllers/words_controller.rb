get '/words' do
	@words = Word.all
	erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

post '/words/new' do
	@word = Word.create(text: params[:text])
	redirect "/words/#{@word.id}"
end

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
