volume = {
  title: 'Hello',
  description: 'A book about how to greet people',
  metadata: '...'
}

section = {
  title: 'Chapter title goes here',
  volume_id: 'uuid here',
  content_count: 123,
  order: 12,
  metadata: {}
}

content = {
  text: 'text from volume section goes here',
  sequence: 12,
  content_type: 'header',
  length: 2543,
  metadata: { italic: true, blockquote: true, indent: true },
  section_id: 'section_id',
  volume_id: 'volume_id'
}


content_variation = {
  text: 'Text from volume goes here, where __this__ is italicized', # all markdown should be italicized

}
