class Admin::CategoriesController < ApplicationController

  def index
    @category_name_to_id = {}
    @product_per_category_count = {}
    @product_category = Category.joins(:products)

    @product_category.map do |i|
      unless @product_per_category_count[i.name] == nil
        @product_per_category_count[i.name] += 1
      else
        @product_per_category_count[i.name] = 1
        @category_name_to_id[i.name] = i.id
      end
    end
  end

  def
    new
  end

  def 
    create
  end
end