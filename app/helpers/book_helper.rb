module BookHelper
  def markdown(text)
    extensions = {
      quote:    true, footnotes: true, tables: true,
      autolink: true, superscript: true, highlight: true,
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    markdown.render(text)
  end

  def disable_actions?(content)
    return true if (content.text == content.text.upcase) && content.text.length < 55
    false
  end

  def collapse?(content)
    return false if disable_actions? content
    return true if content.bookmark_count == 0 # TODO - Algorithm
    false
  end
end