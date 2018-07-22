class CatsController < ApplicationController
  before_action :set_owner
  before_action :set_owner_cat, only: [:show, :update, :destroy]

  def index
    render json: @owner.cats
  end

  def show
    render json: @cat
  end

  def create
    @owner.cats.create(cats_params)
    render json: @owner, status: :created
  end

  def update
    @cat.update(cat_params)
    head :no_content
  end

  def destroy
    @cat.destroy
    head :no_content
  end

  private

  def cats_params
    params.permit(:name, :age)
  end

  def set_owner
    @owner = Owner.find(params[:owner_id])
  end

  def set_owner_cat
    @cat = @owner.cats.find_by!(id: params[:id]) if @owner
  end
end