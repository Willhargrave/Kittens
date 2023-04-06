class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def show
    @kitten = Kitten[:id]
  end
  def new
    @kitten = Kitten.new
  end
  def edit
    
  end
  def delete
  end
end
