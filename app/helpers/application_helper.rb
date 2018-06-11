require 'redcarpet'
require 'redcarpet/render_strip'
module ApplicationHelper
  def markdown (text)
    if text.nil?

    else
      extensions = {
          autolink:           true,
          superscript:        true,
          disable_indented_code_blocks: true
      }
      options = {hard_wrap: true, filter_html: true}
      renderer = Redcarpet::Render::HTML.new(options)
      mark = Redcarpet::Markdown.new(renderer, extensions)
      mark.render(text).html_safe
    end
  end
end
