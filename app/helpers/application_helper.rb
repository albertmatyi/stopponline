module ApplicationHelper

  def title
    base_title = "Stopponline"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def is_active?(page_name)
    s = page_name.split('/')
    c = s[0]
    a = s[1]
    "active" if current_page?(controller: c, action: a)
  end


end
