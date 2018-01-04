class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    
    
    respond_to do |format|
	@user = User.find_by_name(params[:name])
	if @user.password_digest == params[:password_digest]
	    session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'You have logged in' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'You have logged out' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:name, :password_digest, :confirm_password_digest)
    end
end
