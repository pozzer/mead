class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@answer.question, anchor: @answer.id), notice: 'Answer was successfully created.' }
      else
        format.html { redirect_to @answer.question, notice: 'Não foi hoje' }
      end
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @answer = Answer.find(params[:id])
    @answer.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
