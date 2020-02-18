class EventsController < ApplicationController
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
    @event = Event.new(title:params['title'],description:params['description'],admin:current_user,start_date:params['start_date'],price:params['price'], location: params['location'], duration: params['duration'])

    if @event.save
      flash[:success] = "Event bien créé !"
      @success = "Bravo"
      redirect_to root_path(:add_event => @success)
    else
      @fail = @event.errors.full_messages
      puts "========================================================================================="
      puts @event.errors.full_messages
      puts "========================================================================================="
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
