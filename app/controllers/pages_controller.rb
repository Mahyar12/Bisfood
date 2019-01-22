class PagesController < ApplicationController
  layout 'application', :except => [:home, :social_home]

  def add_question
    @question = Question.new
    @qtypes = Qtype.all
    @categories = Category.all
    render layout: 'application'
  end

end
