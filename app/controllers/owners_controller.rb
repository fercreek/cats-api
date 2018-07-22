class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :update, :destroy]

  def index
    @owners = Owner.all
    render json: @owners, status: :ok
  end

  def create
    @owner = Owner.create(owner_params)
    render json: @owner, status: :created
  end

  def show
    render json: @owner
  end

  def update
    @owner.update(owner_params)
    head :no_content
  end

  def destroy
    @owner.destroy
    head :no_content
  end

  private

  def owner_params
    params.permit(:name)
  end

  def set_owner
    @owner = Owner.find(params[:id])
  end
end
