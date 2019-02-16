ActiveAdmin.register Question do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
permit_params :content, :qtype_id
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
   selectable_column
   column "Question", :content
   column "Qtype" do |q|
    link_to q.qtype.name, admin_qtype_path(q.qtype)
   end
   column "Answers" do |q| 
   		q.answers.each do |a|

   			if a.answer_type == "image" or a.answer_type == "portrait"
   			i	image_tag(url_for(Image.find(a.answer_type_id).image.variant(combine_options: {
                auto_orient: true,
                gravity: "center",
                resize: "50x50^",
                crop: "50x50+0+0"
                }))) 
   			 
   			elsif a.answer_type == "text" or a.answer_type == "twoans"
   				b = AnswerText.find(a.answer_type_id)
   				if a.answer_questions.where("question_id = ?", q.id).first.correct == 1
   					li strong b.atext 
   				else 
   					li b.atext 
   				end
   			else
   				span TableGame.find(a.answer_type_id).show_chars
   				li TableGame.find(a.answer_type_id).words

   			end   		
   		end
   end
   column "Category" do |q|
   		link_to q.categories.first.name, admin_category_path(q.categories.first)
   end
end


end
