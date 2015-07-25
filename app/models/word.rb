class Word < ActiveRecord::Base
	before_save :add_letters

	def add_letters
		characters = self.text.chars
		alphabetized_characters = characters.sort
		self.letters = alphabetized_characters.join
	end

	def self.find_anagrams(str)
		sorted_letters = []
		word_list = []

		str.each_char do |c|
			sorted_letters.push(c)
		end
		# ************************************
		# Could have used:
		# sorted_letters = str.chars.sort.join
		# ************************************
		sorted_letters.sort!
		sorted_word = sorted_letters.join
		word_list = Word.where("letters=?", sorted_word)
		find_me = Word.where("text=?", str)
		return word_list
	end
end



#class Post
#	self.per_page = 50
#end

		#*****************************************
		#  Old anagram generator for 3 letter words
		#*****************************************
		#letters = []
		#combos = []
		#anagrams = []
		#str.each_char do
		#	|c| letters.push(c)
		#end

		#3.times do
		#	combos.push(letters.clone.join)
		#	letters.insert(1, letters.delete_at(2))
		#	combos.push(letters.clone.join)
		#	letters.insert(1, letters.delete_at(2))
		#	letters.insert(-1, letters.delete_at(0))
		#end
		
		#combos.each do |combo|
		#	if Word.find_by_text(combo).present?
		#		anagrams.push(combo)
		#	end
		#end
		#return anagrams