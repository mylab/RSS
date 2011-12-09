class HomeController < ApplicationController
  before_filter :session_expiry, :only => [:index]
  before_filter :update_activity_time, :only => [:getfeeds]
  
  def index
    if session[:language]
      @rss = feeds(session[:language])
    end
  end
  def discard
    reset_session
    flash[:error] = 'Sua sessão expirou. Favor entrar novamente.'
    redirect_to :controller => 'home', :action => 'index'
  end
  
  def getfeeds
    if params[:language]
      @language = params[:language]
    else
      @language = session[:language]
    end
    @rss = feeds(@language)
    render :update do |page|
      page.replace_html 'feeds', :partial => 'home/feeds'
      page.replace_html 'tag', :partial => 'home/discard'
    end
  end



  def session_expiry
    if session[:expires_at]
      @time_left = (session[:expires_at] - Time.now).to_i
      unless @time_left > 0
        reset_session
        flash[:error] = 'Sua sessão expirou. Favor entrar novamente.'
        redirect_to :controller => 'home', :action => 'index'
      end
    else
      reset_session
    end
  end

  def update_activity_time
    session[:expires_at] = 1.week.from_now
    session[:language] = params[:language]
  end

  private

  def feeds(language)
    puts "ffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeddddddddddddddsssssssssss", language
    if language == "English"
      @rss = RSS::Parser.parse(open('http://www.arenaflowers.com/files/sitemaps/arenaflowers.com/google_base_feed.xml').read, false)
    end
    if language == "French"
      @rss = RSS::Parser.parse(open('http://www.arenafleurs.fr/files/sitemaps/arenafleurs.fr/google_base_feed.xml').read, false)
    end
    if language == "German"
      @rss = RSS::Parser.parse(open('http://www.arenablumen.de/files/sitemaps/arenablumen.de/google_base_feed.xml').read, false)
    end
    return @rss
  end

end
