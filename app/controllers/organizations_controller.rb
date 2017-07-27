class OrganizationsController < ApplicationController
    def new
    end

  def index
    @organizations = Organization.all
    if session.key?(:user_id)
      @user = User.find(session[:user_id])
    end
  end

  def create
    organization = Organization.new(organization_params)
    if organization.save
      redirect_to '/organizations'
    else
      flash[:errors] = organization.errors.full_messages
      redirect_to '/organizations'
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end
  
  private

  def organization_params
    params.require(:organization).permit(:name, :description)
  end
end

