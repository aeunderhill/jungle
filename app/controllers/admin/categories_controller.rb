class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
    @category_name_to_id = {}
    @product_per_category_count = {}
    @categories = Category.all
    @product_category = Category.joins(:products)

    @categories.each do |x|
      @product_per_category_count[x.name] = 0
      @category_name_to_id[x.name] = x.id
    end

    @product_category.map do |i|
        @category_name_to_id[i.name] = i.id
      end
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product category has been created!'
    else
      render :new

    private

    def category_params
      params.require(:category).permit(:name)
  end
end