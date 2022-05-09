Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:name", { :controller => "users", :action => "show_detail" })
  get("/add_user", { :controller => "users", :action => "create" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show_detail" })
  get("/add_photo", { :controller => "photos", :action => "create" })

  get("/delete_photo/:id", { :controller => "photos", :action => "delete" })
end
