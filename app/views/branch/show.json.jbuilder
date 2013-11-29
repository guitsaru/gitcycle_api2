json.(@branch, :github_url, :lighthouse_url, :name, :source, :title)

json.repo do
  json.(@branch.repo, :name)

  json.owner do
    json.(@branch.repo.owner, :name, :login)
  end if @branch.repo.owner

  json.user do
    json.(@branch.repo.user, :name, :login)
  end
end