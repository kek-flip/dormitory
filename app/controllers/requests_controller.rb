class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]
  before_action :staff?, only: %i[ index show ]
  before_action :student?, only: %i[ new create ]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to '/users/' + @_current_user.login, notice: "Request was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      {
        student_id: (@_user_access == ApplicationController::STUDENT) ?
          (@_current_user_role.id) : (@_current_user_role.student_id),
        staff_id: params[:request][:staff_id].to_i,
        floor: params[:request][:floor].to_i,
        location: params[:request][:location],
        problem: params[:request][:problem]
      }
    end

    def staff?
      redirect_to '/users/' + @_current_user.login, alert: 'Нет доступа' unless @_user_access == ApplicationController::STAFF
    end

    def student?
      redirect_to '/users/' + @_current_user.login, alert: 'Нет доступа' unless @_user_access >= ApplicationController::STUDENT
    end
end
