require 'pw_provider/conf'
require 'tempfile'
require 'securerandom'

RSpec.describe Conf do

  before(:each) do
    Object.send(:remove_const, 'Conf')
    load 'pw_provider/conf.rb'
  end

  describe "#pass_source" do
    it "returns the pass source from temp file" do
      # given
      dotfile = Tempfile.new('testconfig')
      dotfile.puts '[config]'
      dotfile.puts 'pass_source=t123'
      dotfile.flush

      # when then
      expect(Conf.pass_source(dotfile: dotfile.path)).to eq('t123')

      # teardown
      dotfile.close
      dotfile.unlink
    end
  end

  describe "#pass_source" do
    it "returns 'Environment' when file doesn't exist" do
      # given
      non_existent_file = '/file_not_here' + SecureRandom.uuid  
      # when then
      expect(Conf.pass_source(dotfile: non_existent_file)).to eq('Environment')
    end
  end

  describe "#abs_path" do
    it "abs_path with absolute path" do
      # given
      dotfile = '/tmp/test1'
      # when then
      expect(Conf.abs_path(dotfile)).to eq(dotfile)
    end
  end

  describe "#abs_path" do
    it "abs_path with user dir" do
      # given
      dotfile = 'test2'
      # when then
      expect(Conf.abs_path(dotfile)).to eq(File.join(Dir.home, dotfile))
    end
  end

end