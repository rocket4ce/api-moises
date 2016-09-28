class Api::V1::UsersController < Api::V1::ApplicationController

  def create
    email = params[:email]
    usuario = User.find_by_email(email)
    puts "////////////////////"
    puts usuario
    puts "////////////////////"
    pass = params[:password]
    if email && usuario
      if usuario.valid_password?(pass)
        render json: usuario
      else
        rende json: {error: "Mensaje"}
      end
    end
  end
  
end
