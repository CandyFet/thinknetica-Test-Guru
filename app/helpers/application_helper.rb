module ApplicationHelper

  def github_url(creator, repo)
    link_to creator, repo
  end
end
