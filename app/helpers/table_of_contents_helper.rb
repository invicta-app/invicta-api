module TableOfContentsHelper
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
      when 'chapter'
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

  def section_within_part?(section, part, next_part)
    next_sequence = next_part && next_part[:sequence] || Float::INFINITY

    return false if section[:sequence] < part[:sequence]
    return false if section[:sequence] >= next_sequence
    return true
  end

  def contains_section?(segment, section)
    segment.pluck(:id).include? section.id
  end

  def collapse_segment(segment, section)
    'collapse' unless segment.pluck(:id).include? section.id
  end

  def collapse_part(section, part, next_part)
    next_sequence = next_part && next_part[:sequence] || Float::INFINITY
    'collapse' unless (section.sequence > part[:sequence]) && (section.sequence) <= next_sequence
  end

end