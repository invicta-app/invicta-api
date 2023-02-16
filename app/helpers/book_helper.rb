module BookHelper
  def disable_actions?(content)
    return true if (content.text == content.text.upcase) && content.text.length < 55
    false
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    markdown.render(text)
  end
end