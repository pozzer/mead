class FavoriteQuestionsController < AppController
  before_action :set_question, only: [:set_favorite, :remove_favorite]
  before_action :set_favorite_question, only: [:remove_favorite]
  respond_to :js, only: [:set_favorite, :remove_favorite, :index]
  respond_to :html, only: [:index]

  def index
    @favorite_questions = FavoriteQuestion.where(user: current_user).page(params[:favorite_page])

    respond_with(@favorite_questions)
  end

  def set_favorite
    @favorite = current_user.favorite_question(@question).blank?
    @favorite_question = FavoriteQuestion.create({user: current_user, question: @question}) if @favorite
    @question.add_or_update_evaluation(:favorite_question, 1, current_user)
    respond_with(@favorite_question)
  end

  def remove_favorite
    @favorite_question.destroy
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_favorite_question
      @favorite_question = FavoriteQuestion.find(params[:id])
    end
end
