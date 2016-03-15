class MajorAgeValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value.blank?
      if (value.to_date + 18.years) >= Date.today
        object.errors[attribute] << (options[:message] || "Você é quiança volte quando crescer.")
      end
    end
  end
end
