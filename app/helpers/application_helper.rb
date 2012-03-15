module ApplicationHelper

  #
  # Defines a title. And concatenates it with the @title parameter if this 
  # exists
  # 
  def title
    base_title = "Stopponline"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  #
  # Returns 'active' or null, if the current page is the same as the one given
  # as a parameter.
  #
  def is_active?(page_name)
    s = page_name.split('/')
    c = s[0]
    a = s[1]
    "active" if current_page?(controller: c, action: a)
  end
  
  #
  # Converts the flash levels (notice, warning) to corresponding bootstrap style
  # values (info, danger). If no match is found, the key is returned as is.
  #
  def bootstrap_key(key)
    if key == :notice 
      :info
    else 
      if key == :warning
        :danger
      else 
        key
      end
    end
  end

end
