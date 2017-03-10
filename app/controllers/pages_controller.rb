class PagesController < ApplicationController
  def index 
    @students = Unirest.get("#{ENV['DOMAIN']}/students.json").body

    @experiences = Unirest.get("#{ENV['DOMAIN']}/experiences.json").body

    @education = Unirest.get("#{ENV['DOMAIN']}/education.json").body

    @skills = Unirest.get("#{ENV['DOMAIN']}/skills.json").body
    
    @capstones = Unirest.get("#{ENV['DOMAIN']}/capstones.json").body

  end 

  def show
    @students = Unirest.get("#{ENV['DOMAIN']}/students/#{params[:id]}.json").body

    @experiences = Unirest.get("#{ENV['DOMAIN']}/experiences/#{params[:id]}.json").body

    @education = Unirest.get("#{ENV['DOMAIN']}/education/#{params[:id]}.json").body

    @skills = Unirest.get("#{ENV['DOMAIN']}/skills/#{params[:id]}.json").body
    
    @capstones = Unirest.get("#{ENV['DOMAIN']}/capstones/#{params[:id]}.json").body
  end

  def new
  end

  def create 
    @students = Unirest.post("#{ENV['DOMAIN']}/students.json", :headers => {"Accept"=> "application/json"}, :parameters => {: => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.post("#{ENV['DOMAIN']}/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.post("#{ENV['DOMAIN']}/education.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.post("#{ENV['DOMAIN']}/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    @capstones = Unirest.post("#{ENV['DOMAIN']}/capstones.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :description => params[:description], :url => params[:url], :screenshot => params[:screenshot]}).body

    redirect_to "/students/#{@student['id']}" 
  end

  def edit 
    @students = Unirest.post("#{ENV['DOMAIN']}/students/#{params[:id]}.json").body 

    @experiences = Unirest.post("#{ENV['DOMAIN']}/experiences/#{params[:id]}.json").body 

    @education = Unirest.post("#{ENV['DOMAIN']}/education/#{params[:id]}.json").body 

    @skills = Unirest.post("#{ENV['DOMAIN']}/skills/#{params[:id]}.json").body 

    @capstones = Unirest.post("#{ENV['DOMAIN']}/capstones/#{params[:id]}.json").body 
  end 

  def update
    @students = Unirest.patch("#{ENV['DOMAIN']}/students/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.patch("#{ENV['DOMAIN']}/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.patch("#{ENV['DOMAIN']}/api/education.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.patch("#{ENV['DOMAIN']}/api/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    @capstones = Unirest.patch("#{ENV['DOMAIN']}/api/capstones.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :description => params[:description], :url => params[:url], :screenshot => params[:screenshot]}).body

    redirect_to "/students/#{@student['id']}"
  end

  def destroy 
    @students = Unirest.delete("#{ENV['DOMAIN']}/students/#{params[:id]}.json").body

    @experiences = Unirest.delete("#{ENV['DOMAIN']}/experiences/#{params[:id]}.json").body

    @education = Unirest.delete("#{ENV['DOMAIN']}/education/#{params[:id]}.json").body 
    
    @skills = Unirest.delete("#{ENV['DOMAIN']}/skills/#{params[:id]}.json").body

    @capstones = Unirest.delete("#{ENV['DOMAIN']}/capstones/#{params[:id]}.json").body
    
    redirect_to "/students" 
  end 

end
