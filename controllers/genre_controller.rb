require_relative '../models/genre'
#INDEX
get '/genre' do
  @genre = Genre.all
  erb(:'/genre/index')
end

# #NEW
# get '/artists/new' do
#   erb(:'/artists/new')
# end

# #CREATE
# post '/artists' do
#   #code that creates an instance of a new artist. redirects to all artists page. 
#   @artist = Artist.new(params)
#   @artist.save
#   redirect to('/artists')
# end

# #SHOW
# get '/artists/:id' do
#   #code that shows an individual artist entry.
#   @artist = Artist.find(params[:id])
#   erb(:'/artists/show')
# end

# #EDIT
# get '/artists/:id/edit' do
#   #code that takes me to an artist edit form page.
#   @artist = Artist.find(params[:id])
#   erb(:'/artists/edit')
# end

# #UPDATE
# put '/artists/:id' do
#   #code that returns the updated artist for this id. back to individual artist page
#   @artist = Artist.update(params)
#   redirect to('/artists')
# end

# #DELETE
# delete '/artists/:id' do
#   #code that deletes the current artist only
#   @artist = Artist.delete(params[:id])
#   redirect to ('/artists')
# end