class StaticsController < ApplicationController
  def politicacookies
    respond_to do |format| 
      format.html{}
      format.js{ cookies[:div_cookies] = {
        value: true,
        expires: 1.year.from_now,
        domain: ENV['MYBABYBLOG_DOMAIN']
        }
      }
    end
  end
end
