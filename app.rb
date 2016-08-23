 #encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit 
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = { :username => 'Введите ваше имя',
		   :phone => 'Введите номер телефона', 
		   :datetime => 'Введите дату и время'}

	#для каждой пары ключ-значение
	hh.each do |key, value|

		# если параметр пуст
		if params[key] == ''
			# переменной error присвоить value из хеша hh
			# ( а value из хеша hh это сообщение об ошибке)
			# т. е. переменной error присвоить сообщение об ошибке
			@error = hh[key]

			# вернуть представление visit
			 return erb :visit
		end

	end  


	erb "Ok! Ваше имя:ß #{@username}, ваш номер телефона: #{@phone}, время записи: #{@datetime}, ваш мастер: #{@barber} , Цвет волос: #{@color}"
end
