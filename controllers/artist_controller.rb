require_relative '../models/artist'
#INDEX
get '/artists' do
  @artists = Artist.all
  erb(:'/artists/index')
end

#NEW
get '/artists/new' do
  erb(:'/artists/new')
end

#CREATE
post '/artists' do
  #code that creates an instance of a new artist. redirects to all artists page. 
  @artist = Artist.new(params)
  @artist.save
  redirect_to('/artists')
end

#SHOW
get '/artists/:id' do
  #code that shows an individual artist entry.
  @artist = Artist.find(params[:id])
  erb(:'artists/show')
end

#EDIT
get '/artists/:id/edit' do
  #code that takes me to an artist edit form page.
end

#UPDATE
put '/artists/:id' do
  #code that returns the updated artist for this id. back to individual artist page
end

#DELETE
delete '/artists/:id' do
  #code that deletes the current artist only
end