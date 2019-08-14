#Bookmarks

## *User Stories:*

1) As a user
 I would like to see a list of Bookmarks.

 2) As a user
 I would like to add new bookmarks


#Domain Model
```
Client      | Controller    |   Model           | View
        gets request-->
        get 'bookmarks'----->Controller ------> /lib/Bookmark
            |               |                   |
 Bookmarks  |      App      |      Controller <-----     erb :bookmarks        
      <--response                  controller ------>   erb :bookmarks
         :bookmark
         :name
         :link
         :description
            |               |     [Bookmarks ]  |       


```


            **To set up the database**


            Connect to `psql` and create the `bookmark_manager` database and 'bookmark_manager_test' databases:


            To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

            ### To run the Bookmark Manager app:


            rackup -p number(9292 automatically)
