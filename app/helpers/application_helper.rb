module ApplicationHelper

  CREATOR_NAME = 'Fedor Zasechkin'
  PROJECT_URL = 'https://github.com/CandyFet/thinknetica-Test-Guru/'

  def github_url(creator_name, url)
    link_to creator_name, url
  end

  def current_year
    Date.current.year
  end
end
