# TODO use one of the available keychain gems for this

class KeyChain
  def self.get_pw(account)
    cmd = quiet_cmd("security find-generic-password -g -a " + account)
    response = `#{cmd}` 
    response[/^password: "(.*)"$/, 1]
  end

  def self.add_pw(account, password)
    cmd = quiet_cmd("security add-generic-password -a " + account + " -s " + account + " -w " + password)
    `#{cmd}`
  end

  def self.del_pw(account)
    cmd = quiet_cmd("security delete-generic-password -a " + account)
    `#{cmd}`
  end

  def self.quiet_cmd(cmd)
    cmd + ' 2>&1 >/dev/null'
  end

end
