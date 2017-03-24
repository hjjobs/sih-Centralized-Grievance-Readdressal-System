class ComplaintController < ApplicationController

  before_action :check_user_logged_in

  def index
    render json: {status: "success"}
  end

  def create
    complaint = Complaint.new(subject: params[:subject],
     description: params[:description], image: params[:image],
     latitude: params[:latitude], longitude: params[:longitude],
     city: params[:city], state: params[:state], pincode: params[:pincode],
     user_id: params[:user_id],  ##todo: params[user_id]
      status: "new" , priority: "new")
  end

end
