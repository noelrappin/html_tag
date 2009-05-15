class Html
  include ActionView::Helpers::TagHelper 
  
  attr_accessor :tag, :content, :options
  
  def self.br
    "<br />"
  end
  
  def self.method_missing(name, *args, &block)
    Html.new(name, *args, &block)
  end
  
  def initialize(tag, content = [], options = {}, &block)
    @tag = tag 
    if content.is_a? Hash
      @options = content
      @content = []
    else
      @content = [content]
      @options = options
    end
    block.call(self) if block
  end
  
  def method_missing(name, args)
    options[name] = args
  end
  
  def <<(text)
    content << text
    content.compact.flatten
  end
  
  def to_s
    content_tag(tag, content.join("\n"), options)
  end
  
  def to_str
    to_s
  end
  
  
end
