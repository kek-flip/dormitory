# frozen_string_literal: true

# Messages controller
class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit; end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    if @message.update(message_params)
      redirect_to messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    redirect_to messages_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).merge(council_member_id: @_current_user_role.id).permit(:title, :text,
                                                                                     :council_member_id)
  end
end
