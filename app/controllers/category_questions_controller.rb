class CategoryQuestionsController < ApplicationController
  before_action :set_category_question, only: [:show, :edit, :update, :destroy]

  # GET /category_questions
  # GET /category_questions.json
  def index
    @category_questions = CategoryQuestion.all
  end

  # GET /category_questions/1
  # GET /category_questions/1.json
  def show
  end

  # GET /category_questions/new
  def new
    @category_question = CategoryQuestion.new
  end

  # GET /category_questions/1/edit
  def edit
  end

  # POST /category_questions
  # POST /category_questions.json
  def create
    @category_question = CategoryQuestion.new(category_question_params)

    respond_to do |format|
      if @category_question.save
        format.html { redirect_to @category_question, notice: 'Category question was successfully created.' }
        format.json { render :show, status: :created, location: @category_question }
      else
        format.html { render :new }
        format.json { render json: @category_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_questions/1
  # PATCH/PUT /category_questions/1.json
  def update
    respond_to do |format|
      if @category_question.update(category_question_params)
        format.html { redirect_to @category_question, notice: 'Category question was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_question }
      else
        format.html { render :edit }
        format.json { render json: @category_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_questions/1
  # DELETE /category_questions/1.json
  def destroy
    @category_question.destroy
    respond_to do |format|
      format.html { redirect_to category_questions_url, notice: 'Category question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_question
      @category_question = CategoryQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_question_params
      params.require(:category_question).permit(:category_id, :question_id)
    end
end
