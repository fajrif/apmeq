#ecl

This Website was built using [Rails](http://rubyonrails.org/) ( version 5.2 ). and [Ruby](https://www.ruby-lang.org/en/) ( version 2.5.1 )
For installation. First, you need to install all required dependencies:

* Install Centos 7 & create `deployer` user [Centos7](https://www.centos.org/)
* Install [RVM](https://rvm.io/), [Ruby](https://www.ruby-lang.org/en/) 2.5.1
* Install [SQLite3](https://www.sqlitetutorial.net/sqlite-tutorial/download-install-sqlite/) database.
* Install [NGINX](http://nginx.org/en/) HTTP and reverse proxy server

##### Setup Server Centos 7 and Create sudo user

We recommend to use Centos 7 for server and create user `deployer` with
suso priviledge for intallation and configuration on you machine.
Please follow this [Link](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-centos-quickstart) for how to add new sudo user.

- - -

##### Install RVM, Ruby 2.5.1

Please follow this [Guidence](https://tecadmin.net/install-ruby-latest-stable-centos/) for install rvm on Centos 7

    > curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    > curl -L get.rvm.io | bash -s stable
    > source /etc/profile.d/rvm.sh
    > rvm reload
    > rvm install 2.5.1

- - -

##### Install SQLite3 Database
Ensure you install **SQLite3** database correctly.

* [Install SQLite3 and Tutorial](https://www.sqlitetutorial.net/sqlite-tutorial/download-install-sqlite/)

- - -

##### Install NGINX (Production)
There are some good resources explaining about how to install **NGINX** on your local machine or your production server:

* [How To Install Nginx on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7)

---

#### Setting up the Rails App
After you already installed the required dependencies, now it's time to setting up the Rails Apps. First you need to change your current directory into **ecl** folder and run the `bundle install` command to install all the required gems.

    > cd ecl
    > gem install bundler
    > bundle install

it will automatically install all the required gem with Rails version 5.2

- - -

##### Configure The Database
To configure database user, you can change change the configutation file in `config/database.yml`.

		production:
			<<: *default
			database: db/production.sqlite3

For production web server will using database name db/production.sqlite3.

After that you will need to run this command to setup the initial data:

    > rake db:create RAILS_ENV=production
    > rake db:migrate RAILS_ENV=production
    > rake db:seed RAILS_ENV=production

it will create all the seeds data into the database (and also
administrator user login) :

    email: admin@ecl.com
    password: secret

- - -

##### Runing web server with NGINX & Unicorn
To run this website using production environment, First you need to
precompile rails assets:

* Run this comand on the console

        > rake assets:precompile
        > sudo cp -f config/nginx.conf /etc/init.d/nginx

* Restart NGINX & start the unicorn process

        > sudo systemctl reload nginx
        > bundle exec unicorn -E production -c config/unicorn.rb -D

open your web browser and go to [http://yourdomain.com](http://yourdomain.com) for public section
For admin section go to [http://yourdomain.com/admins](http://yourdomain.com/admins)

- - -
