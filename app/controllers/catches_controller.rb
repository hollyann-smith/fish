class CatchesController < ApplicationController
  before_action :set_catch, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  # GET /catches or /catches.json
  def index
    @catches = Catch.all
  end

  # GET /catches/1 or /catches/1.json
  def show
    @catch = Catch.find(params[:id])
    @comments = @catch.comments
    @comment = Comment.new
  end

  # GET /catches/new
  def new
    # @catch = Catch.new
    @catch = current_user.catches.build
  end

  # GET /catches/1/edit
  def edit
  end

  # POST /catches or /catches.json
  def create
    # @catch = Catch.new(catch_params)
    @catch = current_user.catches.build(catch_params)

    respond_to do |format|
      if @catch.save
        format.html { redirect_to @catch, notice: "Catch was successfully created." }
        format.json { render :show, status: :created, location: @catch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catches/1 or /catches/1.json
  def update
    respond_to do |format|
      if @catch.update(catch_params)
        format.html { redirect_to @catch, notice: "Catch was successfully updated." }
        format.json { render :show, status: :ok, location: @catch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catches/1 or /catches/1.json
  def destroy
    @catch.destroy!

    respond_to do |format|
      format.html { redirect_to catches_path, status: :see_other, notice: "Catch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @catch = current_user.catches.find_by(id: params[:id])
    redirect_to catches_path, notice: "Not Authorized to Edit this Fish" if @catch.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catch
      @catch = Catch.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def catch_params
      params.expect(catch: [ :species, :bait, :weather, :date, :notes, :user_id, :photo ])
    end
end
