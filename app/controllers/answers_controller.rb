class AnswersController < ApplicationController
  def create
    binding.pry
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
      else
        format.html { redirect_to @answer.question, notice: 'Não foi hoje' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content)
    end
end
