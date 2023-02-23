module BookHelper
  def markdown(text)
    extensions = {
      quote:    true, footnotes: true, tables: true,
      autolink: true, superscript: true, highlight: true,
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    markdown.render(text)
  end

  def organize_toc(toc)
    introduction = []
    conclusion   = []
    info         = []
    parts        = []
    sections     = []

    toc.each do |segment|
      case segment[:section_type]
      when 'introduction'
        introduction.push(segment)
      when 'conclusion'
        conclusion.push(segment)
      when 'info'
        info.push(segment)
      when 'part'
        parts.push(segment)
      when 'section'
        sections.push(segment)
      else
        sections.push(segment)
      end
    end

    {
      introduction: introduction,
      conclusion:   conclusion,
      info:         info,
      parts:        parts,
      sections:     sections,
    }
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