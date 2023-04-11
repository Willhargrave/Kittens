class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kittens }
    end
  end
  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kitten }
    end
  end
  def new
    @kitten = Kitten.new
  end
  def edit
    @kitten = Kitten.find(params[:id])
  end
  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity, notice: "Look at that, you failed at filling at a form"
    end
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
