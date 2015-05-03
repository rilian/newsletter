It Watch
========

This project aims to streamline delivery of quality
IT reading/watching resources to curious developers

Install & Run
-------------

1. `git clone git@github.com:rilian/it-watch.git && cd it-watch`
2. `bundle install`
3. edit `config/database.yml`
4. edit `db/seed.rb` and make new credentials for Manager
5. `rake db:setup`
6. `cp .env.example .env`
7. edit `.env`
8. `rails s`
9. open `http://0.0.0.0:3000`

Contributing
------------

Pull requests are welcome!
