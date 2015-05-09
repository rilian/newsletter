Newsletter
========

This project aims to streamline delivery of quality IT reading/watching
resources to curious developers.

In Newsletter, Managers can add interesting links to IT articles, 
slides or videos, and eventually create new subscription Issue that will be
immediately delivered to Subscribers. Issue will include all new Links that 
were recently created. Subscribers can add their email, and in every Issue 
email they will receive a link to update (disable or enable) their
subscription.

Install & Run
-------------

1. `git clone git@github.com:rilian/newsletter.git && cd newsletter`
2. `bundle install`
3. `cp config/database.yml.example config/database.yml`
3. edit `config/database.yml` and put database settings
4. `cp .env.example .env`
5. edit `.env` file and put your secret settings
6. `rake db:setup`
7. `rails s`
8. open `http://0.0.0.0:3000`

It is recommended to sign up on a great email delivery service
[Mandrill](https://mandrillapp.com/) which offers 12000 free deliveries
monthly.

Contributing
------------

Pull requests are welcome!
