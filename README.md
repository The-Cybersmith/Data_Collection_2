# README

This was created on an ubuntu virtual machine, which took hours, because RUBY WAS CREATED BY MALEVOLENT EXTRATERRESTRIAL MONSTERS TO TORMENT HUMANITY.
The following steps were performed to create all of this.

First: install PostGres (when asked for a password, just use "password", security isn't a concern for this test)
```
sudo apt install postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser -s cybersmith -P
sudo -u postgres psql

```

Second: setup git (may also require public-private SSH keywork)
```
git clone git@github.com:The-Cybersmith/Data_Collection_2.git
```

Third: setup Ruby, and modify BASH to use its commandicles
```
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git
PREFIX=/usr/local sudo ./ruby-build/install.sh
rbenv install -l
rbenv install 2.7.5
rbenv global 2.7.5
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem env home
gem install rails -v 6.1.4.1
rbenv rehash
cd Data_Collection_2
```

Fourth: setup NodeJS (one of the many bloody dependencies of this cursed software stack)
```
sudo apt install nodejs
npm cache clean -f
sudo npm install -g n
sudo n stable
hash -r

```

Fifth: create rails app (you can skip this if you are just using my code, not creating your own)

```
rails new . -d=postgresql
```

Sixth: get yarn to work (this stage will make you cry, scream, and curse god).
```
sudo apt install yarn
npm upgrade yarn
npm upgrade yarn --global
sudo apt remove cmdtest
sudo apt remove yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y
yarn install
yarn add @rails/webpacker
rails webpacker:install
bundle install
rails webpacker:compile
```

Seventh: setup the rails itself (sigh with relief, and wonder if it's not too late to run off to Ukraine and become a mercenary)
```
bin/rails db:create
bin/rails s
```

Okay, that was SETUP.

You may now open the browser of your choice, and go to: http://localhost:3000/
___________________________________________________________________
What follows is purely internal overview commentary on how and why certain aspects of the program were coded, and has no relevance to the running of it.
___________________________________________________________________


The first major obstacle is that Ruby On Rails is very unintuitive with the setup of its views.
The second is that the specification wants each question presented separately, but the Rails activeRecord system wants an entire model created.
So a method had to be found to store the early data until the user was finished with the preview, then put it all into the database at once.

With PHP this could be done with session variables. Rails doesn't work this way, because it is a tool put on earth for the purpose of maximising suffering, a sort of anti-Utilitarian Bizarro-Bentham monstrosity, utterly defiant to the principles and ideals of morally sound humans everywhere. Whilst session variables do exist in Rails, they are stored partly on the client side. This does make it possible, just... very strange.

Rails wants all the data at once so it can use its "create" process. Three separate pages for three separate inputs won't satisfy this.

The next bloody horrible nightmare experience was creating forms for each page in the process. Because each question needs its own page, then a specific form is needed to point to the next question. This is... RIDICULOUSLY DIFFICULT. Rails doesn't let me just directly make forms, that would be FAR too sensible. No, it has to be QUIRKY, and DIFFERNT TO PHP. It has a strange "form_with" method, with arcane syntax which makes it hard to see where the form is pointed. After much googling, I managed to set those up.

The first question requires no parameters, and is reached by the "get" method. The latter two questions, and preview, can be reached only via "post". The final display process needs to be reachable via both methods (as I wanted the display to be viewable without having to add a new one).

Further difficulty comes from allowing people to navigate back. I cannot see a method for allowing free navigation that doesn't break. I settled on allowing a total reset.

Further complicating this is that, in rails, I can't just re-use html components like in PHP, so any repeated elements have to be manually entered every time.

The next issue is that users should not be allowed to progress if the data they enter is invalid. Logically, this should require a redirect on a failed enty. The problem? In Ruby, you cannot redirect with post, and you cannot pass parameters with get. >:[

So now all the steps have to accept get, or they won't be reachable via redirect... WHY IS THIS DESIGNED THIS WAY?
