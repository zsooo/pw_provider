#!/usr/bin/env ruby
require 'pw_provider/keychain'
KeyChain.add_pw(ARGV[0], ARGV[1])