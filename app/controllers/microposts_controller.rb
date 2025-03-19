class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[destroy create]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Created Micropost!'
      redirect_to root_url
    else
      redirect_to 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    # destroy action
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
