class StaticPagesController < ApplicationController
  def home
  end

  def menu
    @categories = Category.all
  end

  def dashboard
  end
end
