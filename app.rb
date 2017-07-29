require "sinatra"

get '/' do
message = params[:message] 
erb :login, locals:{message:message}
end

post '/login' do
	correct_login = {scstew: "12345"}
	username = params[:username]
	password = params[:password]
	correct_login.each_pair do |user, value|
		if username == user.to_s && password == value
			message = "successful login"
			redirect '/names?message=' + message
		elsif username == user.to_s
			message = "incorrect password"
			redirect '/?message=' + message
		elsif password == value
			message = "incorrect username"
			redirect '/?message=' + message
		end
	end
		message = "incorrect username and password"
		redirect '/?message=' + message			
end


get '/names' do
	message = params[:message]
	erb :name, locals:{message:message}
end

post '/names' do
	lastname = params[:lastname]
	firstname = params[:firstname]
	redirect '/calculator?firstname=' + firstname + 'lastname=' + lastname
end

get '/calculator' do
	"test"

end