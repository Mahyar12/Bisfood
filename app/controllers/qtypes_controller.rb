class QtypesController < ApplicationController
  before_action :set_qtype, only: [:show, :edit, :update, :destroy]

  # GET /qtypes
  # GET /qtypes.json
  def index
    @qtypes = Qtype.all
  end

  # GET /qtypes/1
  # GET /qtypes/1.json
  def show
  end

  # GET /qtypes/new
  def new
    @qtype = Qtype.new
  end

  # GET /qtypes/1/edit
  def edit
  end

  # POST /qtypes
  # POST /qtypes.json
  def create
    @qtype = Qtype.new(qtype_params)

    respond_to do |format|
      if @qtype.save
        format.html { redirect_to @qtype, notice: 'Qtype was successfully created.' }
        format.json { render :show, status: :created, location: @qtype }
      else
        format.html { render :new }
        format.json { render json: @qtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qtypes/1
  # PATCH/PUT /qtypes/1.json
  def update
    respond_to do |format|
      if @qtype.update(qtype_params)
        format.html { redirect_to @qtype, notice: 'Qtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @qtype }
      else
        format.html { render :edit }
        format.json { render json: @qtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qtypes/1
  # DELETE /qtypes/1.json
  def destroy
    @qtype.destroy
    respond_to do |format|
      format.html { redirect_to qtypes_url, notice: 'Qtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qtype
      @qtype = Qtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qtype_params
      params.require(:qtype).permit(:name)
    end
end
