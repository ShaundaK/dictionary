# show the word’s definition, top example, and pronunciation:

require 'Unirest'

p "Enter a word."

word = Unirest.get("https://api.wordnik.com/v4/word.json/good?useCanonical=false&includeSuggestions=true&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
definition = Unirest.get("https://api.wordnik.com/v4/word.json/good/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
example = Unirest.get("https://api.wordnik.com/v4/word.json/good/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
pronunciation = Unirest.get("https://api.wordnik.com/v4/word.json/good/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

word = word.body["word"]
definition = definition.body[0]["text"]
example = example.body["text"]
pronunciation = pronunciation.body[0]["raw"]

p "The word #{word} means #{definition} and is prounounced as #{pronunciation}. This is the top #{example}."

# JSON.pretty_generate(definition.body)
# JSON.pretty_generate(example.body)
# JSON.pretty_generate(pronunciation.body)

# puts "Enter a word."
# user_response = gets.chomp





