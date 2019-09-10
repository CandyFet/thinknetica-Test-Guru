module ApplicationHelper

  def github_url
    link_to 'Fedor Zasechkin', 'https://github.com/CandyFet/thinknetica-Test-Guru/'
  end

  def current_year
    Date.today.year
  end
end
