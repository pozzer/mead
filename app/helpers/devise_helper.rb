module DeviseHelper

  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      error_key = 'devise.failure.invalid'
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:span, msg) }.join
    sentence = I18n.t(error_key, :authentication_keys => "Email",
                                 :count    => errors.count,
                                 :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4 class="font-w300 push-15">Opps!</h4>
        <p>#{messages}</p>
      </div>
    HTML

    html.html_safe
  end
end