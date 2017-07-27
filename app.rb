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
			redirect '/test_page'
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

get '/test_page' do
	erb :test_page
end
