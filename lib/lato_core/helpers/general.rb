module LatoCore

  # This helper contain general functions.
  module Helper::General

    def erb_open_tag
      return "<span class='erb-tag'>&#060;&#037;</span>".html_safe
    end
    
    def erb_close_tag
      return "<span class='erb-tag'>&#037;&#062;</span>".html_safe
    end

  end

end
