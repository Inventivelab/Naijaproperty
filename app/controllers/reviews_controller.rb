class ReviewsController < ApplicationController
    def create
      @has_reviewed = Review.where(user_id: review_params[:user_id]).first
      if @has_reviewed.nil?
          # Allow to review
          @review = current_user.reviews.create(review_params)
          flash[:success] = "Review created..."
      else
          # Already reviewed
          flash[:success] = "You already submitted a reviewed"
      end
    # else
    #   flash[:alert] = "Not found "
    # end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
		@review = Review.find(params[:id])
		@review.destroy

    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end

	private

		def review_params
			params.require(:review).permit(:content, :star, :user_id)
		end
end
