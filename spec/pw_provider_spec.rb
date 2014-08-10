require 'pw_provider'
require 'pw_provider/conf'

RSpec.describe PwProvider do

  describe "#get" do
    it "returns the pass from keychain" do
      # given
      account = 'testacc'
      pass = 'testpass'
      allow(PwProvider).to receive(:pass_source).and_return('KeyChain')
      allow(KeyChain).to receive(:get_pw).with(account).and_return(pass)

      # when then
      expect(PwProvider.get(account)).to eq(pass)
    end
  end
  
  describe "#get" do
    it "returns the pass from the env" do
      # given
      account = 'testacc'
      pass = 'testpass'
      allow(Conf).to receive(:pass_source).and_return('Environment')
      allow(Environment).to receive(:get_pw).with(account).and_return(pass)

      # when then
      expect(PwProvider.get(account)).to eq(pass)
    end
  end
end
