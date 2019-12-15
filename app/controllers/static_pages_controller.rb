class StaticPagesController < ApplicationController

  #controller for Home page
  def home
  end

  #controller for contact page, allows form to access message object
  def contact
    @message = Message.new
  end

  #create controller for contact page when form is submitted
  def create
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to contact_path, notice: "Your message has been successfully sent!"
    else
      render :contact
    end

  end

  private
  #strong parameters to take in input from user
  def message_params
    params.require(:message).permit(:name, :email, :message)
  end

end
