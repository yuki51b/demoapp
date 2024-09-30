class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      redirect_to root_path, notice: '登録できました'
    else
      flash.now[:alert] = '登録できませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def step_params
    params.require(:step).permit(:gender, :food, :color)
  end

end
