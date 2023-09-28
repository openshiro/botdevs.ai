module Admin
  class InquiriesController < ApplicationController
    # GET /inquiries
    def index
      @inquiries = Inquiry.all
    end

    # GET /inquiries/1
    def show
      @inquiry = Inquiry.find(params[:id])
    end

    # GET /inquiries/new
    def new
      @inquiry = Inquiry.new
    end

    # POST /inquiries
    def create
      @inquiry = Inquiry.new(inquiry_params)

      if @inquiry.save
        redirect_to admin_inquiry_path(@inquiry), notice: "Inquiry was successfully created."
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
end
