class PagesController < ApplicationController
  def index 
    @students = Unirest.get("http://localhost:3000/api/students.json").body

    @experiences = Unirest.get("http://localhost:3000/api/experiences.json").body

    @education = Unirest.get("http://localhost:3000/api/education.json").body

    @skills = Unirest.get("http://localhost:3000/api/skills.json").body

  end 

  def show
    @students = Unirest.get("http://localhost:3000/api/students/#{params[:id]}.json").body

    @experiences = Unirest.get("http://localhost:3000/api/experiences/#{params[:id]}.json").body

    @education = Unirest.get("http://localhost:3000/api/education/#{params[:id]}.json").body

    @skills = Unirest.get("http://localhost:3000/api/skills/#{params[:id]}.json").body

  end

  def new
  end

  def create 
    @students = Unirest.post("http://localhost:3000/api/students.json", :headers => {"Accept"=> "application/json"}, :parameters => {: => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.post("http://localhost:3000/api/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.post("http://localhost:3000/api/education.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.post("http://localhost:3000/api/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    redirect_to "/students/#{@student['id']}" 
  end

  def edit 
    @students = Unirest.post("http://localhost:3000/api/students/#{params[:id]}.json").body 

    @experiences = Unirest.post("http://localhost:3000/api/experiences/#{params[:id]}.json").body 

    @education = Unirest.post("http://localhost:3000/api/education/#{params[:id]}.json").body 

    @skills = Unirest.post("http://localhost:3000/api/skills/#{params[:id]}.json").body 
  end 

  def update
    @students = Unirest.patch("http://localhost:3000/api/students/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :phone_number => params[:phone_number], :short_bio => params[:short_bio], :linkedin_url => params[:linkedin_url], :twitter_handle => params[:twitter_handle], :personal_blog => params[:personal_blog], :online_resume_url => params[:online_resume_url], :github_url => params[:github_url], :photo => params[:photo]}).body

    @experiences = Unirest.patch("http://localhost:3000/api/experiences.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :job_title=> params[:job_title], :company_name => params[:company_name], :details => params[:details]}).body

    @education = Unirest.patch("http://localhost:3000/api/education.json", :headers => {"Accept"=> "application/json"}, :parameters => {:start_date => params[:start_date], :end_date => params[:end_date], :degree=> params[:degree], :university_name => params[:university_name], :details => params[:details]}).body

    @skills = Unirest.patch("http://localhost:3000/api/skills.json", :headers => {"Accept"=> "application/json"}, :parameters => {:skill_name => params[:skill_name]}).body

    redirect_to "/students/#{@student['id']}"
  end

  def destroy 
    @students = Unirest.delete("http://localhost:3000/api/students/#{params[:id]}.json").body

    @experiences = Unirest.delete("http://localhost:3000/api/experiences/#{params[:id]}.json").body

    @education = Unirest.delete("http://localhost:3000/api/education/#{params[:id]}.json").body 
    
    @skills = Unirest.delete("http://localhost:3000/api/skills/#{params[:id]}.json").body
    
    redirect_to "/students" 
  end 

end
