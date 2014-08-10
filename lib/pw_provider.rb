require 'pw_provider/version'
require 'pw_provider/key_chain'
require 'pw_provider/conf'
require 'pw_provider/environment'

module PwProvider

  def PwProvider.get(key)
    eval(Conf.pass_source).get_pw(key)
  end
  
end
  
