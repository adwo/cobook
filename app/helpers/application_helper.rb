module ApplicationHelper
  # Title helper. It find @title variable and echo it within <title></title>
  # tags. If variable @detail_tile defined, this method echo it only if
  # type == :defailt.
  def title(type=nil)
    @detail_title = @title if @detail_title.nil?
    if type == :detail
      @detail_title
    else
      @title
    end
  end
end
