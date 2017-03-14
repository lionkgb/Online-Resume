class PagesController < ApplicationController
  def index 
    @students = Unirest.get("http://localhost:3000/students.json").body

    @experiences = Unirest.get("http://localhost:3000/experiences.json").body

    @education = Unirest.get("http://localhost:3000/educations.json").body

    @skills = Unirest.get("http://localhost:3000/skills.json").body
    
    @capstones = Unirest.get("http://localhost:3000/capstones.json").body

  end 

  def show
    @students = Unirest.get("http://localhost:3000/students/#{params[:id]}.json").body

    @experiences = Unirest.get("http://localhost:3000/experiences/#{params[:id]}.json").body

    @education = Unirest.get("http://localhost:3000/educations/#{params[:id]}.json").body

    @skills = Unirest.get("http://localhost:3000/skills/#{params[:id]}.json").body
    
    @capstones = Unirest.get("http://localhost:3000/capstones/#{params[:id]}.json").body
  end

  def new
  end

  def create 
    @students = Unirest.post("http://localhost:3000/students.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.post("http://localhost:3000/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.post("http://localhost:3000/educations.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.post("http://localhost:3000/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    @capstones = Unirest.post("http://localhost:3000/capstones.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :description => params[:description], :url => params[:url], :screenshot => params[:screenshot]}).body

    redirect_to "/students/#{@student['id']}" 
  end

  def edit 
    @students = Unirest.post("http://localhost:3000/students/#{params[:id]}.json").body 

    @experiences = Unirest.post("http://localhost:3000/experiences/#{params[:id]}.json").body 

    @education = Unirest.post("http://localhost:3000/educations/#{params[:id]}.json").body 

    @skills = Unirest.post("http://localhost:3000/skills/#{params[:id]}.json").body 

    @capstones = Unirest.post("http://localhost:3000/capstones/#{params[:id]}.json").body 
  end 

  def update
    @students = Unirest.patch("http://localhost:3000/students/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.patch("http://localhost:3000/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.patch("http://localhost:3000/api/educations.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.patch("http://localhost:3000/api/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    @capstones = Unirest.patch("http://localhost:3000/api/capstones.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :description => params[:description], :url => params[:url], :screenshot => params[:screenshot]}).body

    redirect_to "/students/#{@student['id']}"
  end

  def destroy 
    @students = Unirest.delete("http://localhost:3000/students/#{params[:id]}.json").body

    @experiences = Unirest.delete("http://localhost:3000/experiences/#{params[:id]}.json").body

    @education = Unirest.delete("http://localhost:3000/educations/#{params[:id]}.json").body 
    
    @skills = Unirest.delete("http://localhost:3000/skills/#{params[:id]}.json").body

    @capstones = Unirest.delete("http://localhost:3000/capstones/#{params[:id]}.json").body
    
    redirect_to "/students" 
  end 

end
