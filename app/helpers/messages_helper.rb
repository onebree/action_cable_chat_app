module MessagesHelper

  # Returns sanitized HTML from input text using Github-flavored Markdown
  def markdown_to_html(text)
    Kramdown::Document.new(text, :input => "GFM").to_html
  end
end
