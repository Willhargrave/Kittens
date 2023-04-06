class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def show
    @kitten = Kitten.find(params[:id])
  end
  def new
    @kitten = Kitten.new
  end
  def edit
    @kitten = Kitten.find(params[:id])
  end
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten editted!"
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other, notice: "Successfully deleted kitten!"
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :cuteness, :age, :softness)
  end
end
