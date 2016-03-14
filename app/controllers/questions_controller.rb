class QuestionsController < AppController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  respond_to :js, only: [:vote]

  def index
    @questions = Question.all
    respond_with @questions
  end

  def show
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
    #value = params[:type] == "up" ? 1 : -1
    #@question = Question.friendly.find(params[:id])
    #@question.add_or_update_evaluation(:votes, value, current_user)
    #respond_with(@question)
  end

  private
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    def question_params
      params.require(:question).permit([:title, :content, { tag_list: [] }])
    end
end
