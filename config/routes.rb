Rails.application.routes.draw do

  get('/', {:controller => "users", :action => "index"})

  get('/users', {:controller => "users", :action => "index"})
  get('/users/:name', {:controller => "users", :action => "show_detail"})

  get('/photos', {:controller => "photos", :action => "index"})
  get('/photos/:id', {:controller => "photos", :action => "show_detail"})

end
