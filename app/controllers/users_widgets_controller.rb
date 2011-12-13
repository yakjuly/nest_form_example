class UsersWidgetsController < ApplicationController
  # GET /users_widgets
  # GET /users_widgets.json
  def index
    @users_widgets = UsersWidget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users_widgets }
    end
  end

  # GET /users_widgets/1
  # GET /users_widgets/1.json
  def show
    @users_widget = UsersWidget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @users_widget }
    end
  end

  # GET /users_widgets/new
  # GET /users_widgets/new.json
  def new
    @users_widget = UsersWidget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @users_widget }
    end
  end

  # GET /users_widgets/1/edit
  def edit
    @users_widget = UsersWidget.find(params[:id])
  end

  # POST /users_widgets
  # POST /users_widgets.json
  def create
    @users_widget = UsersWidget.new(params[:users_widget])

    respond_to do |format|
      if @users_widget.save
        format.html { redirect_to @users_widget, :notice => 'Users widget was successfully created.' }
        format.json { render :json => @users_widget, :status => :created, :location => @users_widget }
      else
        format.html { render :action => "new" }
        format.json { render :json => @users_widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_widgets/1
  # PUT /users_widgets/1.json
  def update
    @users_widget = UsersWidget.find(params[:id])

    respond_to do |format|
      if @users_widget.update_attributes(params[:users_widget])
        format.html { redirect_to @users_widget, :notice => 'Users widget was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @users_widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_widgets/1
  # DELETE /users_widgets/1.json
  def destroy
    @users_widget = UsersWidget.find(params[:id])
    @users_widget.destroy

    respond_to do |format|
      format.html { redirect_to users_widgets_url }
      format.json { head :ok }
    end
  end
end
