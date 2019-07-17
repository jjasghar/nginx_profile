control "nginx-1.0" do
  impact 0.7
  title "Verify nginx directory is there"

  describe file('/etc/nginx') do
    it { should be_directory }
  end
end

control "nginx-2.0" do
  impact 0.7
  title "Verify nginx application is there"

  describe file('/usr/sbin/nginx') do
    it { should be_file }
    its('mode') { should cmp '0755' }
  end
end

control "nginx-3.0" do
  impact 0.7
  title "Verify nginx should be running"
  describe processes('nginx: master process') do
    it { should exist }
  end
end
