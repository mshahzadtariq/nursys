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

Below is simple example:

    paya = Paya::Base.new
    options = {
        transaction_id: '',
        request_id: '',
        first_name: '',
        ......
    }
    identifier = 'R' # Other possible options include 'A', 'V', 'F', 'O', 'P' etc
    single_ccd_check = paya.process_single_ccd_check options, identifier
    # Response has has two main hashes, one is request xml sent to paya server and other is paya server response

    request_xml = single_ccd_check[:request]
    response = single_ccd_check[:response]

Similarly you can process PPD check

    paya = Paya::Base.new
    options = {
        transaction_id: '',
        request_id: '',
        first_name: '',
        ......
    }
    identifier = 'R' # Other possible options include 'A', 'V', 'F', 'O', 'P' etc
    single_ppd_check = paya.process_single_ppd_check options, identifier
    # single_ppd_check hash has has two main hashes, one is request xml sent to paya server and other is paya server response

    request_xml = single_ppd_check[:request]
    response = single_ppd_check[:response]

There are also certification/development methods available

    paya = Paya::Base.new
    options = {
            transaction_id: '',
            request_id: '',
            first_name: '',
            ......
        }
    terminal_id = REQUIRED-TERMINAL-ID
    identifier = 'R' # Other possible options include 'A', 'V', 'F', 'O', 'P' etc

    paya.process_single_certification_check options, terminal_id, identifier

To process advance level payments, there are methods available in individual classes for CCD, PPD, TEL and WEB

    options = {
                transaction_id: '',
                request_id: '',
                first_name: '',
                ......
            }

    guaranteed_cedit_debit_ccd_payment = Paya::Ccd::Guaranteed::CreditDebitTransaction.new options

    check_no_verification_dl_optional = guaranteed_cedit_debit_ccd_payment.check_no_verification_dl_optional
    # check_no_verification_dl_optional hash has has two main hashes, one is request xml sent to paya server and other is paya server response

    request_xml = check_no_verification_dl_optional[:request]
    response = check_no_verification_dl_optional[:response]

Above example would automatically pick terminal id from configuration file.

Similarly there are classes/methods available for Guaranteed/Non Guaranteed Credit Debit and Debit only transactions for CCD, PPD, WEB and TEL

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nursys/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request