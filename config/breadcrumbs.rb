# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_mypages_path
  parent :mypages
end

crumb :addcard do
  link "支払い方法", addcard_mypages_path
  parent :mypages
end

crumb :card_info do
  link "支払い方法", card_info_mypages_path
  parent :mypages
end

crumb :personal_info do
  link "本人確認情報", personal_info_mypages_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypages
end

crumb :card_info do
  link "支払い方法", card_info_mypages_path
  parent :mypages
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).