# Rate App

Application for [Funbox's test task(Level III, Q2)](https://dl.funbox.ru/qt-ruby.pdf).

## Usage
### Setup and start
- `bundle install` - install required dependencies
- `rails test` - run tests
- `rails s` - start server. Then you can visit `http://localhost:3000/` 

### Description

The application displays the current dollar rate. The exchange rate is periodically updated.

On the route `/admin`, you can set the value of time and the dollar exchange rate.
After that, the rate value on all pages of the application will be changed until the moment indicated on the page `/admin`