## Rick's Music Store

## Description

A RESTful web application allowing a record store owner to Create, Read, Update & Delete 
artists and albums from his stock inventory.
1st solo project while studying at CodeClan.

## MVP

The owner of Rockin' Rick’s Music Store, Rick, wants an app which will help him keep on top of his store inventory. 
He does not want an app that customers will see, but he will use to check stock levels and see what he needs to order soon.
You should be able to add stock, which would have an Artist and Album as well as the quantity available. 
He would ideally like:
    • Inventory page
        ○ Show stock level of all items:
            § High/Medium/Low based on quantity
    • Add albums
    • Add artists
    • Add stock
    
## Extras

Any further analysis would be appreciated but not required, for example:
    • Create route that sends down Inventory data as JSON
    • Work out the markup for each product ( there could be a buy price and a sell price )
        ○ Total possible sales & markup on inventory page
    • Search functionality on Inventory page
    • Associated Genre (Rick associates one Genre to an Artist)
    
## Dependencies

Ruby with Sinatra and PG Gems.

PostgreSQL - install instructions [here](https://www.postgresql.org/docs/9.6/static/tutorial-install.html)

## Instructions

Clone repository using `git clone https://github.com/mv86/ricks-music-stock-app`
Create psql database using `psql` then `create database ricks_music_app`
Create database tables using `psql -d ricks_music_app -f db/ricks_music_app.sql` from root project folder
Add seed data using `ruby db/seed.rb` from root project folder
Start server using `ruby controller.rb` from root project folder
Application will run on localhost:4567
