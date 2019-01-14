class AnswerTextsController < ApplicationController
  before_action :set_answer_text, only: [:show, :edit, :update, :destroy]

  # GET /answer_texts
  # GET /answer_texts.json
  def index
    @answer_texts = AnswerText.all
  end

  # GET /answer_texts/1
  # GET /answer_texts/1.json
  def show
  end

  # GET /answer_texts/new
  def new
    @answer_text = AnswerText.new
  end

  # GET /answer_texts/1/edit
  def edit
  end

  # POST /answer_texts
  # POST /answer_texts.json
  def create
    @answer_text = AnswerText.new(answer_text_params)

    respond_to do |format|
      if @answer_text.save
        format.html { redirect_to @answer_text, notice: 'Answer text was successfully created.' }
        format.json { render :show, status: :created, location: @answer_text }
      else
        format.html { render :new }
        format.json { render json: @answer_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_texts/1
  # PATCH/PUT /answer_texts/1.json
  def update
    respond_to do |format|
      if @answer_text.update(answer_text_params)
        format.html { redirect_to @answer_text, notice: 'Answer text was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_text }
      else
        format.html { render :edit }
        format.json { render json: @answer_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_texts/1
  # DELETE /answer_texts/1.json
  def destroy
    @answer_text.destroy
    respond_to do |format|
      format.html { redirect_to answer_texts_url, notice: 'Answer text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_text
      @answer_text = AnswerText.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_text_params
      params.require(:answer_text).permit(:atext)
    end
end
