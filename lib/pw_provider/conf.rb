require 'inifile'

# reads .pw_provider from user home dir to decide
# where to read our passwords from:
# - keychain
# - environment variables
module Conf

  def Conf.abs_path(dotfile)
    dotfile =~ /^\// ? dotfile : File.join(Dir.home, dotfile)
  end

  def Conf.inifile(dotfile)
    @inifile ||= IniFile.load(abs_path(dotfile))
  end

  # default to 'Environment'
  def Conf.pass_source(dotfile: '.pw_provider')
    inifile(dotfile) ? inifile(dotfile)['config']['pass_source'] : 'Environment'
  end
end
 