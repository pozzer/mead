class QuestionsController < AppController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :can_edit?, only: [:edit]
  respond_to :js, only: [:vote]

  def index
    @newests = Question.newer.page(params[:newest_page])
    @unanswereds = Question.top_rated.without_best_answer.page(params[:unanswered_page])
    @votes = Question.top_rated.page(params[:vote_page])
  end

  def new
    @question = Question.new
    respond_with @question
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.save
    respond_with @question
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @question = Question.friendly.find(params[:id])
    @question.add_or_update_evaluation(:votes, value, @question.user)
    @question.create_activity key: "question.vote", owner: current_user, params: { type:params[:type] }

    respond_with(@question)
  end

  def update
    @question.update_attributes(question_params)
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    def question_params
      params.require(:question).permit([:title, :content, { tag_list: [] }])
    end

    def can_edit?
      unless @question.can_edit?(current_user.id)
        redirect_to question_path(@question), :flash => { :error => "Você não pode editar essa pergunta." }
      end
    end

end
