#This file was generated by "bin/rails generate controller threat name contact severity preview display"

class ThreatController < ApplicationController
  skip_before_action :verify_authenticity_token #necessary to prevent browser caching from making it all
  def name
    #Blank out any session variables.
  session[:name] = ""
  session[:email] = ""
  session[:severity] = ""
  end

  def contact
    # check character length, and redirect if it isn't enough
    if (params[:threat][:name].length < 2)
      redirect_to '/threat/name'
    else
      session[:name] = params[:name]
    end
  end

  def severity
    # check email validity, and redirect if it isn't valid
    if (params[:threat][:email] =~ URI::MailTo::EMAIL_REGEXP)
      session[:email] = params[:email]
    else
      redirect_to '/threat/contact'
    end
  end

  def preview
    # check severity validity, and redirect if it isn't valid
    if (Globals::ModelConstraints::Severities.include? params[:threat][:severity])
      session[:severity] = params[:severity]
    else
      redirect_to '/threat/severity'
    end
  end

  def display
    # Instance variables allow the frontend to show data.
    @severity = "cheese"
    @name = session[:name]
    @email = session[:email]
  end
end
