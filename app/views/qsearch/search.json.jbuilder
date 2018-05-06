json.basics do
  json.array!(@basics) do |basic|
    json.name basic.full_name
    json.url resume_path basic.resume.id
  end
end

json.users do
  json.array!(@users) do |user|
    json.name user.email
    json.url resume_path user.resumes.first
  end
end
