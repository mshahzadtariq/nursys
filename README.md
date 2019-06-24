# Nursys
Ruby wrapper for Nursys License Verification API. This is developed by reading Nursys API documentation to help open source community. This is not official ruby wrapper of Nursys nor developed by Nursys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nursys'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nursys

## Usage

Generate a new initializer file in config/initializers folder with your Nursys credentials using following command.

    $ rails generate nursys:install

To get Nursys credentials, contact with Paya development team at https://nursys.com

After that, you can manage Licenses and check status of different License Types  

Below is simple example to enroll new nurse:

    nurse = Nursys::Nurse.new(
      jurisdiction: 'WA',
      license_number: '123456788',
      license_type: 'RN',
      address1: 'n/a',
      address2: 'n/a',
      state: 'WS',
      city: 'Washington',
      zip: '00000',
      email: 'test@test.com',
      birth_year: '1968',
      hospital_practice_setting: '21'
    )
    
    nurse.save # It would return true or false based on given data
You need only once to enrol nurse to your account, after that you retrieve its status anytime.

Similarly you can add new license to checklist:

    nursys_license = Nursys::License.new(
                     license_number: '12345678',
                     jurisdiction: 'WA',
                     license_type: 'RN',
                     record_ID: 18872 # Some random id
                )
                
    transaction_id = nursys_license.save # It would return transaction id which can be used to check status of license anytime
                 
To Check license status using transaction id:
                 
    response = Nursys::License.find @license.transaction_id
    
    # response is hash of attributes returned by Nursys system according to status of license.                    
                 
    
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nursys/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request