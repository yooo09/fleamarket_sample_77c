crumb :root do
  link "トップページ", root_path
end

crumb :users do
  link "マイページ", user_path(current_user.id)
end

crumb :credit_card do
  link "クレジットカード確認", user_credit_card_path(current_user.id)
  parent :users
end

crumb :logout do
  link "ログアウト",  logout_user_path(current_user.id)
  parent :users
end

crumb :adresses do
  link "新規住所登録",  new_user_adress_path(current_user.id)
  parent :users
end

crumb :item do
  link Item.find(params[:id]).item_name, item_path
  parent :root
end


# crumb :search do |q|
#   link q.name_cont
#   parent :root
# end


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