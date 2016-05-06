class AnswersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_answer, only: [:vote, :vote_best_answer, :update]
  before_action :can_edit?, only: [:update]
  respond_to :js, only: [:vote]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@answer.question, anchor: @answer.id), notice: 'Resposta criada com sucesso!.' }
      else
        format.html { redirect_to @answer.question, notice: 'Não foi hoje' }
      end
    end
  end

  def update
    @answer.update_attributes(answer_params)
    redirect_to question_path(@answer.question)
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @answer = Answer.find(params[:id])
    @answer.add_or_update_evaluation(:votes, value, current_user)
  end

  def vote_best_answer
    @answer = Answer.find(params[:id])
    @answer.voted_the_best
    @answer.add_or_update_evaluation(:best_votes, 1, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end


  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end

    def can_edit?
      unless @answer.can_edit?(current_user.id)
        redirect_to question_path(@answer.question), :flash => { :error => "Você não pode editar essa resposta." }
      end
    end
end
