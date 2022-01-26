# README

This was created on an ubuntu virtual machine, which took hours, because RUBY WAS CREATED BY MALEVOLENT EXTRATERRESTRIAL MONSTERS TO TORMENT HUMANITY.
The following steps were performed to create all of this.

First: install PostGres
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
yarn install
rails webpacker:install
bundle install
```

Seventh: setup the rails itself (sigh with relief, and wonder if it's not too late to run off to Ukraine and become a mercenary)
```
bin/rails db:create
bin/rails s
```

Okay, that was SETUP.


