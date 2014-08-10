# pw_provider

A very simple password utility to pull passwords from different sources, currently supporting:
- environment variables (for backwards compatibility)
- Mac OSX KeyChain (more secure)


## Installation

Add this line to your application's Gemfile:

  gem 'pw_provider'

And then execute:

  $ bundle

Or install it yourself as:

  $ gem install pw_provider

## Usage

Configure the method you want to use:

  $ cat ~/.pw_provider
  [config]
  pass_source=KeyChain

or 

  [config]
  pass_source=Environment

It defaults to Environment when no config file is present.

In your code where you need a password:

  PwProvider.get('account_name')

Example:

  OpenSSL::PKey::RSA.new(cert_private_key, PwProvider.get('my_cert_pass_identifier'))




## Contributing

1. Fork it ( https://github.com/[my-github-username]/pw_provider/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
