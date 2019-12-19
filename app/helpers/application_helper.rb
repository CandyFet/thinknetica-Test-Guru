module ApplicationHelper

  CREATOR_NAME = 'CandyFet'
  GITHUB_URL = 'https://github.com/'
  PROJECT_NAME = 'thinknetica-Test-Guru'

  def github_url(creator_name, project_name)
    link_to project_view_string(creator_name, project_name), generate_project_url(creator_name, project_name)
  end

  def current_year
    Date.current.year
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, class: "flash #{key}"
    end.join.html_safe
  end

  private

  def project_view_string(creator, project)
    "#{creator} #{project}"
  end

  def generate_project_url(creator, project)
    "#{GITHUB_URL}/#{creator}/#{project}"
  end

end
