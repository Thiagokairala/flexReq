class PracticesController < ApplicationController
	def update
		questionnaire = Questionnaire.where(id: params[:questionnaire_id]).first
		practice_to_delete = Practice.where(id: params[:id]).first
		practice_to_replace = practice_to_delete.equivalent
		
		practices = remove_practice(questionnaire, practice_to_delete)
		
		practices.push(practice_to_replace)
		questionnaire.update(practices: practices)
		redirect_to edit_questionnaire_path(questionnaire)
	end

	def destroy
		questionnaire = Questionnaire.where(id: params[:questionnaire_id]).first
		practice_to_delete = Practice.where(id: params[:id]).first
		practices = remove_practice(questionnaire, practice_to_delete)
		questionnaire.update(practices: practices)
		redirect_to edit_questionnaire_path(questionnaire)
	end

	private

	def remove_practice(questionnaire, practice)
		practices = questionnaire.practices
		practices.delete(practice_to_delete)
		return practices
	end
end
