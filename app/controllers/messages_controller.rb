class MessagesController < ApplicationController
  before_action { authorize Message }
  
  def index
    @posts = Message.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 5)      
    raise ArgumentError if @posts.out_of_bounds?    
  rescue ArgumentError, RangeError
    redirect_to root_path
  end

  def create
    @message = Message.new(user_id: current_user.id)
    @message.assign_attributes(permitted_attributes(@message))    
    @parent_message = Message.find_by(id: @message.parent_id)
    
    if @message.valid?
      @message.save
      flash.now[:success] = 'Your message has been posted'
    end
  end

  def edit
    # to be implemented
  end

  def update
    # to be implemented
  end
end