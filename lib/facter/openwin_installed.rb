Facter.add(:openwin_installed) do
  setcode do
    Dir.exists?("/usr/openwin/lib")
  end
end
