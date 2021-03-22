class ChickensController < ApplicationController
  before_action :get_flock
  before_action :set_chicken, only: %i[ show edit update destroy ]

  # GET /chickens or /chickens.json
  def index
    @chickens = @flock.chickens
  end

  # GET /chickens/1 or /chickens/1.json
  def show
  end

  # GET /chickens/new
  def new
    @chicken = @flock.chickens.build
    authorize! :create, @chicken
  end

  # GET /chickens/1/edit
  def edit
    authorize! :manage, @chicken
  end

  # POST /chickens or /chickens.json
  def create
    @chicken = @flock.chickens.build(chicken_params)

    authorize! :create, @chicken

    respond_to do |format|
      if @chicken.save
        format.html { redirect_to flock_chicken_path(@flock, @chicken), notice: "Chicken was successfully created." }
        format.json { render :show, status: :created, location: @chicken }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chickens/1 or /chickens/1.json
  def update
    authorize! :manage, @chicken

    respond_to do |format|
      if @chicken.update(chicken_params)
        format.html { redirect_to flock_chicken_path(@flock, @chicken), notice: "Chicken was successfully updated." }
        format.json { render :show, status: :ok, location: @chicken }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chickens/1 or /chickens/1.json
  def destroy
    authorize! :manage, @chicken

    @chicken.destroy
    respond_to do |format|
      format.html { redirect_to flock_chickens_path(@flock), notice: "Chicken was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chicken
      @chicken = @flock.chickens.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chicken_params
      params.require(:chicken).permit(:name, :born_at, :breed_id)
    end

    def get_flock
      @flock = Flock.find(params[:flock_id])
    end
end
