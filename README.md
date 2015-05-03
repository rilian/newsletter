It Watch
========

This project aims to streamline delivery of quality
IT reading/watching resources to curious developers

Install & Run
-------------

1. `git clone git@github.com:rilian/it-watch.git && cd it-watch`
2. `bundle install`
3. `cp config/database.yml.example config/database.yml`
3. edit `config/database.yml` and put database settings
4. `cp .env.example .env`
5. edit `.env` file and put your secret settings
6. `rake db:setup`
7. `rails s`
8. open `http://0.0.0.0:3000`

Contributing
------------

Pull requests are welcome!
