class MessagesController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations
    @notifications = current_user.mailbox.notifications.group_by &:sender_id
    @receipts = current_user.mailbox.receipts
    @message = current_user.mailbox.inbox.first.messages.first.body

  end

# GET /message/new
  def new
  # @reg = Reg.find_by_email(params[:email])  
  @reg = Reg.find(params[:reg])
  @message = current_user.messages.new
    # display form
  end

  # POST /message/create
  def create
    @recipient = Reg.find_by(id: params[:reg])
    # @recipient = Reg.find(session[:reg_id])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end
end