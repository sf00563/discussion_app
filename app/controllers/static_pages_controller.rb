class StaticPagesController < ApplicationController
  def home
  end

  def contact
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to contact_path, notice: "Your message has been successfully sent!"
    else
      render :contact
    end

  end

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end

end
