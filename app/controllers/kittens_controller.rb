class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def show
    @kitten = Kitten[:id]
  end
  def new
  end
  def edit
  end
end
