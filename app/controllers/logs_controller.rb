class LogsController < ApplicationController

  before_action :authenticate_by_session, only: [ :index, :show ]
  before_action :authenticate_by_token,   only: :create

  def index
    @logs = Log.paginate(:page => params[:page]).order("id desc")
  end

  def create
    log = Log.create_from_params(params, @user)
    render json: { :id => log.id }
  end

  def show
    @log     = Log.find(params[:id])
    @entries = @log.log_entries.order("ran_at, id")
  end
end
