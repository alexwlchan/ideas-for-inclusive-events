# Various text cleanups.

module Jekyll
  module CleanupsFilter
    def cleanup_text(input)
      # Replace any mention of "PyCon" with the appropriate non-breaking space
      text = input.gsub("PyCon ", "PyCon&nbsp;")

      text
    end
  end
end

Liquid::Template::register_filter(Jekyll::CleanupsFilter)
