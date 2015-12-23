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
4. edit `config/database.yml` and put database settings
5. `cp .env.example .env`
6. edit `.env` file and put your secret settings
7. `rake db:setup`
8. `npm install -g bower`
9. `bower install -f` to install bower components
10. `rails s`
11. open `http://0.0.0.0:3000`

It is recommended to sign up on a great email delivery service
[Mandrill](https://mandrillapp.com/) which offers 12000 free deliveries
monthly.

Contributing
------------

Pull requests are welcome!
