class InputsController < ApplicationController

  def index
    @input = Input.all
  end

  def new
    @input = Input.new
  end

  def create
    input_params = params.require(:input).permit([:name, :email, :department, :message])
    @input        = Input.new(input_params)
    if @input.save
      redirect_to input_path(@input), notice: "Support Ticket Created"
    else
      render :new
    end
  end

  def show
    @input = Input.find params[:id]
  end

  def edit
    @input = Input.find params[:id]
  end

  def update
    @input = Input.find params[:id]
    input_params = params.require(:input).permit([:name, :email, :department, :message])
    if @input.update(input_params)
      redirect_to input_path(@input), notice: "Support Ticket Updated"
    else
      render :edit
    end
  end

  def destroy
    @input = Input.find params[:id]
    @input.destroy
    redirect_to root_path, notice: "Support Ticket deleted"
  end


end
