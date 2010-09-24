module ApplicationHelper
  def title(type=:page)
    @detail_title = @title if @detail_title.nil?
    if type == :detail
      @detail_title
    else
      @title
    end
  end
end
