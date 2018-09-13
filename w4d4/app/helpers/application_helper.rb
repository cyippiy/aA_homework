module ApplicationHelper

  def auth_token
    output = '<input type="hidden"'
    output += 'name="authenticity_token"'
    output += "value=\"#{form_authenticity_token}\"/>"
    output.html_safe
  end
end
