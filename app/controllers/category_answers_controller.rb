class CategoryAnswersController < ApplicationController
  before_action :set_category_answer, only: [:show, :edit, :update, :destroy]

  # GET /category_answers
  # GET /category_answers.json
  def index
    @category_answers = CategoryAnswer.all
  end

  # GET /category_answers/1
  # GET /category_answers/1.json
  def show
  end

  # GET /category_answers/new
  def new
    @category_answer = CategoryAnswer.new
  end

  # GET /category_answers/1/edit
  def edit
  end

  # POST /category_answers
  # POST /category_answers.json
  def create
    @category_answer = CategoryAnswer.new(category_answer_params)

    respond_to do |format|
      if @category_answer.save
        format.html { redirect_to @category_answer, notice: 'Category answer was successfully created.' }
        format.json { render :show, status: :created, location: @category_answer }
      else
        format.html { render :new }
        format.json { render json: @category_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_answers/1
  # PATCH/PUT /category_answers/1.json
  def update
    respond_to do |format|
      if @category_answer.update(category_answer_params)
        format.html { redirect_to @category_answer, notice: 'Category answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_answer }
      else
        format.html { render :edit }
        format.json { render json: @category_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_answers/1
  # DELETE /category_answers/1.json
  def destroy
    @category_answer.destroy
    respond_to do |format|
      format.html { redirect_to category_answers_url, notice: 'Category answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_answer
      @category_answer = CategoryAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_answer_params
      params.require(:category_answer).permit(:category_id, :answer_id)
    end
end
