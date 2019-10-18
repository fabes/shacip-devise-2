class TestShacipController < ApplicationController
  def show
    user = User.new(email: 'fabes@localhost.com', password: 'pass1234')

    if user.email.present?
      sign_in user
    end
    render json: current_user
  end
end
