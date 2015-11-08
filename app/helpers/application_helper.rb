module ApplicationHelper
  def form_error_messages!(model)
    return '' if model.errors.empty?

    messages = model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div id='error_explanation'>
        <h2>#{flash.now[:alert]}</h2>
        <ul>
          #{messages}
        </ul>
      </div>
    HTML

    html.html_safe
  end
end
