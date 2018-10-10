# sh# show the word’s definition, top example, and pronunciation:

require 'Unirest'

p "Enter a word."
user_response = gets.chomp

user_word = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_response}?useCanonical=false&includeSuggestions=true&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

word = user_word.body
word.each do |words|
  p word["word"]
end

user_definition = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_response}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

definition = user_definition.body
definition.each do |definitions|
  p definition[0]["text"]
end

user_example = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_response}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

example = user_example.body
example.each do |examples|
  p example["text"]
end

user_pronunciation = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_response}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

pronunciation = user_pronunciation.body
pronunciation.each do |pronunciations|
  p pronunciation[0]["raw"]
end

# p "The word #{word} means #{definition}. It is prounounced as #{pronunciation}. The top example of the word, #{word} is #{example}."

# JSON.pretty_generate(definition.body)
# JSON.pretty_generate(example.body)
# JSON.pretty_generate(pronunciation.body)

# puts "Enter a word."
# user_response = gets.chomp




