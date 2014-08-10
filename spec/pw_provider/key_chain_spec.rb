require 'pw_provider/key_chain'

RSpec.describe KeyChain do

  describe "#add_pw" do
    it "creates a new password" do
      # given
      account = 'pw_provider-test'
      pass = 'testpass'

      # when
      KeyChain.add_pw(account, pass)

      # then
      expect(KeyChain.get_pw(account)).to eq(pass)

      # teardown
      KeyChain.del_pw(account)
    end
  end



  describe "#get_pw" do
    it "gets the pass from the keychain" do
      # given
      account = 'pw_provider-test'
      pass = 'testpass'
      KeyChain.add_pw(account, pass)

      # when
      result = KeyChain.get_pw(account)

      # then
      expect(result).to eq(pass)

      # teardown
      KeyChain.del_pw(account)
    end
  end


  describe "#del_pw" do
    it "deletes the pass from the keychain" do
      # given
      account = 'pw_provider-test'
      pass = 'testpass'
      KeyChain.add_pw(account, pass)

      # when
      KeyChain.del_pw(account)

      # then
      empty = KeyChain.get_pw(account)
      expect(empty).to eq(nil)
    end
  end
  
end
