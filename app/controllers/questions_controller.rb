class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def add_questions
    if params.has_key?(:questions)
      @questions = params[:questions]      
      @questions.each do |i, question|        
          q = Question.new(content: question[:question])
          q.qtype = Qtype.find_by_name(question[:type])
          q.save!
          @category = Category.find_by_name(question[:category])
          q.categories << @category
          question[:answers].each do |j, answer|
          
            a = q.answers.create(answer_type: answer[:answer_type], answer_type_id: answer[:answer_type_id])    
            a.categories << @category
            if (q.qtype.name == "text" or q.qtype.name == "twoans") and a.answer_type == "text"
              t = AnswerText.new(atext: answer[:answer])
              t.save!
              a.answer_type_id = t.id

            elsif q.qtype.name == "table" and a.answer_type == "table"
              t = TableGame.new(show_chars: answer[:show_chars], words: answer[:words])
              t.save!
              a.answer_type_id = t.id
            end 
            a.save!
            aq = AnswerQuestion.where("cast(question_id as text) == ? and cast(answer_id as text) == ?", q[:id], a[:id])[0]
            aq.correct = answer[:correct]
            aq.save!
          end
          q.save!      
      end
      render json: {status: 200, message: "Created successfully"}
    else
      render json: {status: 500, message: "Error"}
    end
  end

  def get_questions
    @questions = Question.all.shuffle[0..params[:count].to_i]

    @response = @questions.map do |q|
      @answers = []
      ca = AnswerQuestion.where("cast(question_id as text) == ? and cast(correct as text) == ?", q.id, "1").shuffle[0]
      if ca != nil
        @answers << ca.answer
      end
      AnswerQuestion.where("cast(question_id as text) == ? and cast(correct as text) == ?", q.id, "0").shuffle[0..2].each do |aq|
        @answers << aq.answer
      end
      if q.qtype.name == "twoans"
        @answers = @answers.shuffle[0..1]
      elsif q.qtype.name == "table"
        @answers = [@answers.shuffle[0]]
      else 
        @answers = @answers.shuffle[0..3]
      end
      @correct = 0
      @a = @answers.each_with_index.map do |ans, i|
        puts ans.answer_questions.all.to_json 
        if ans.answer_questions.where("cast(question_id as text) == ?", q.id)[0].correct == 1
          @correct = i
        end
        if ans.answer_type == "image"
          {id: ans.id, value: url_for(Image.find(ans.answer_type_id).image), correct: ans.answer_questions.where("cast(question_id as text) == ?", q.id)[0].correct}
        elsif ans.answer_type == "text"
          {id: ans.id, value: AnswerText.find(ans.answer_type_id).atext, correct: ans.answer_questions.where("cast(question_id as text) == ?", q.id)[0].correct}
        elsif ans.answer_type == "table"
          tg = TableGame.find(ans.answer_type_id)
          {id: ans.id, show_chars: tg.show_chars, words: tg.words }
        end
      end
        { id: q.id, content: q.content, qtype: q.qtype.name, correct: @correct, answers: @a }   
    end
    render json: @response.to_json
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :qtype_id, :answer_question_id, :category_question_id)
    end
end
