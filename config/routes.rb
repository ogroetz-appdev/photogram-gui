Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:name", { :controller => "users", :action => "show_detail" })
  get("/add_user", { :controller => "users", :action => "create" })
  get("/update_user/:username", {:controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show_detail" })
  get("/add_photo", { :controller => "photos", :action => "create" })
  get("/update_photo/:id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:id", { :controller => "photos", :action => "delete" })
  get("/add_comment/:photo_id", { :controller => "photos", :action => "add_comment"})
end
