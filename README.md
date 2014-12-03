RoR Ecommerce Application
===

[![Build Status](https://travis-ci.org/AAlvAAro/ecommerce.svg?branch=master)](https://travis-ci.org/AAlvAAro/ecommerce)

* Install ruby's version ~> 2.1

* Clone the repository
```bash
git clone https://github.com/AAlvAAro/ecommerce
```

* Install the dependencies without production gems
```bash
bundle install --without production
```

* Run database's migration before running the project
```bash
rake db:migrate
```

* Run the server
```bash
bundle exec rails server
```

* To run all the tests:
```bash
rspec
```

* To run specific tests use the name of the folder where your tests are
```bash
rspec spec/folder_name
```



* Contribute and improve the application by solving an issue   
