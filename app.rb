require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

post('/words') do
  input = params[:word]
  word = Word.new(input, nil)
  word.save
  @words = Word.all
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new(params[:definition], @word.id, nil)
  definition.save
  erb(:word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:word])
  @words = Word.all
  erb(:word)
end

delete ('/words') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @words = Word.all
  erb(:words)
end


get ('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  erb(:definition)
end

patch ('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.find(params[:def_id].to_i)
  definition.update(params[:definition], @word.id)
  erb(:word)
end

delete ('/words/:id/definitions/:def_id') do
  definition = Definition.find(params[:def_id].to_i)
  definition.delete
  @word = Word.find(params[:id].to_i)
  erb(:word)
end
