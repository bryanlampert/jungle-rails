class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find params["product_id"]
    @review = Review.new(review_params)
    @review.user_id = @current_user.id
    if @review.save
      redirect_to @product
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy!
    puts.inspect
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :description, :rating)
  end

end
