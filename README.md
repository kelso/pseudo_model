# PseudoModel

ActiveRecord Validations without ActiveRecord? No problem.

## Installation

Add this line to your application's Gemfile:

    gem 'pseudo_model'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pseudo_model

## Usage

If you want to build form with validations, but you don't need store data to database, this is for you.

For instance, you want calculation request form.

Create app/model/calculation_request.rb and define class from PseudoModel::Base

    class CalculationRequest < PseudoModel::Base
      attr_accessor :name, :message
      validates :message, :presence => true
    end

Now you can use `valid?` method:

    calc_request = CalculationRequest.new
    calc_request.valid? #=> false
    calc_request.message = "Hello, I want to know how much..."
    calc_request.valid? #=> true

In controller you can simply do:

    def new
      @calculation_request = CalculcationRequest.new
    end

    def create
      @calculation_request = CalculcationRequest.new(params[:calculation_request])
      if @calculation_request.valid?
        # send email or something
      else
        render :new
      end
    end

Building a form is simple as that:

    <%= form_for @calculation_request do |f| %>
      ...
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
