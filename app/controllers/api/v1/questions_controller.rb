module Api
  module V1
    class QuestionsController < Api::V1::BaseController
      def add_questions
        puts "here"
        if params.has_key?(:questions)

          @questions = params[:questions]
          @questions.each do |i, question| 
            puts "adsafdsafdsaf"
            puts question[:question]
              q = Question.new(content: question[:question])
                        puts "adsafdsafdsaf"
          puts Qtype.find_by_name(question[:type])
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
                  t = TableGame.new(show_chars: answer[:show_chars], words: answer[:words].to_json)
                  t.save!
                  a.answer_type_id = t.id
                end 
                a.save!
                aq = AnswerQuestion.where("question_id = ? and answer_id = ?", q[:id], a[:id])[0]
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

      def add_questions_file
        puts "here"
        if params.has_key?(:questions)

          @questions = params[:questions]
          @questions.each do |question| 
              q = Question.new(content: question[:question])
                        puts "adsafdsafdsaf"
          puts Qtype.find_by_name(question[:type])
              q.qtype = Qtype.find_by_name(question[:type])
              q.save!
              @category = Category.find_by_name(question[:category])
              q.categories << @category
              question[:answers].each do | answer|
              
                a = q.answers.create(answer_type: answer[:answer_type], answer_type_id: answer[:answer_type_id])    
                a.categories << @category
                if (q.qtype.name == "text" or q.qtype.name == "twoans") and a.answer_type == "text"
                  t = AnswerText.new(atext: answer[:answer])
                  t.save!
                  a.answer_type_id = t.id

                elsif q.qtype.name == "table" and a.answer_type == "table"
                  t = TableGame.new(show_chars: answer[:show_chars], words: answer[:words].to_json)
                  t.save!
                  a.answer_type_id = t.id
                end 
                a.save!
                aq = AnswerQuestion.where("question_id = ? and answer_id = ?", q[:id], a[:id])[0]
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
        if params[:count].nil?
          render json: {status: 500, result: "ERROR"}
          return
        end
        ids = Question.pluck(:id).shuffle[0..params[:count].to_i]
        @questions = Question.where(id: ids)

        @response = @questions.map do |q|
          @answers = []
          ca = AnswerQuestion.where("question_id = ? and correct = ?", q.id, 1).shuffle[0]
          if ca != nil
            @answers << ca.answer
          end
          if q.qtype.name == "portrait"
            # CategoryAnswer.joins("INNER JOIN answers ON answers.id = category_answers.answer_id and answers.answer_type = 'image' ").joins("INNER JOIN answer_questions ON answer_questions.answer_id = answers.id").where("question_id <> ?", q.id).shuffle[0..2].each do |aq|
            q.categories.first.answers.shuffle[0..2].each do |aq|
              @answers << aq 
            end
          else
            AnswerQuestion.where("question_id = ? and correct = ?", q.id, 0).shuffle[0..2].each do |aq|
              @answers << aq.answer
            end
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
            # puts ans.answer_questions.all.to_json 
            corr = ans.answer_questions.where("question_id = ?", q.id)[0] == nil ? 0 : ans.answer_questions.where("question_id = ?", q.id)[0].correct
            if corr == 1
              @correct = i
            end
            if ans.answer_type == "image"
              @content = q.content
              {id: ans.id, value: url_for(Image.find(ans.answer_type_id).image.variant(combine_options: {
                auto_orient: true,
                gravity: "center",
                resize: "300x300^",
                crop: "300x300+0+0"
                })), correct: corr}
            elsif ans.answer_type == "text"
              @content = q.content
              {id: ans.id, value: AnswerText.find(ans.answer_type_id).atext, correct: corr}
            elsif ans.answer_type == "table"
              tg = TableGame.find(ans.answer_type_id)
              @content = tg.show_chars 
              {id: ans.id, value: tg.words, correct: 1 }
            end
          end
            @category = q.categories.first
            if @category == nil
              { id: q.id, content: @content, qtype: q.qtype.name, correct: @correct, answers: @a, category_name: "", category_id: -1 }   
            else
              { id: q.id, content: @content, qtype: q.qtype.name, correct: @correct, answers: @a, category_name: @category.name, category_id: @category.id }   
            end
        end
        render json: {questions: @response}.to_json
      end

    end 
  end
end
