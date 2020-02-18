class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @events = Event.order('events.start_date ASC').all
  end

  def show
    set_current_event
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = Event.new(title:params['title'],description:params['description'],admin:@user,start_date:params['start_date'],price:params['price'], location: params['location'], duration: params['duration'])

    if @event.save
      flash[:success] = "Event bien créé !"
      @success = "Bravo"
      redirect_to @event
    else
      @fail = @event.errors.full_messages
      render new_event_path
    end
  end

  def edit

  end


  def update

  end

  def destroy

  end


  private

  def set_current_event
    @event = Event.find(params[:id])
  end
  
  def set_current_id
    @id = params['id']
  end

end
