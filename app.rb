require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddles')
require('pry')

get('/') do
  erb(:index)
end

get('/question1') do
  erb(:question1)
end

post('/a') do
  answer = params.fetch("question1")
  if (answer == "3")
    erb(:question2)
  else
    erb(:fail)
  end
end

# get('/question2') do
#   erb(:question2)
# end

post('/b') do
  answer = params.fetch("question2")
  if (answer == "ice cream")
    erb(:question3)
  else
    erb(:fail)
  end
end

# get('question3') do
#   erb(:question3)
# end

post('/c') do
  answer = params.fetch("question3")
  if (answer == "man")
    erb(:success)
  else
    erb(:fail)
  end
end
