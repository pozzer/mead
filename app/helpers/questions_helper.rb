module QuestionsHelper

  def this_is_creator?(user_id)
    current_user.id == user_id
  end

end
