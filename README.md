# Anagram app using Ruby and Sinatra

Built while taking online course from Skillcrush.  Recently updated to Ruby 2.4.1.  Recently updated gems.  Recently
tested with PostgreSQL 9.6 on macOS 10.12.6.  Was originally built on Ubuntu 12.04.

If you'd like to run the app, you need a PostgreSQL DB.  Check the database.yml for configuration.  For the tests
to pass, I had to run `bundle exec rake db:test:prepare`.  However, it's been a long time since I've had to monkey
with preparing the test database, so maybe this isn't necessary??  To run the app, make sure you setup your db,
`bundle exec rake db:setup`.  This will also seed your db with a large number of words.  After that, you should
just be able to run `bundle exec puma` or `bundle exec rackup`.  Puma will spit out something like "0.0.0.0:9292".  You should be able to
navigate to that URL in your browser and use the application.
