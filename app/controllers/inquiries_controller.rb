class InquiriesController < ApplicationController
  invisible_captcha honeypot: :subtitle
  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_back(fallback_location: root_path, notice: "You are now subscribed to the newsletter.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def inquiry_params
    params.require(:inquiry).permit(:email, :name)
  end
end
