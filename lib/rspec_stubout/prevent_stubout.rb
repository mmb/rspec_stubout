# encoding: UTF-8

module RspecStubout

  module_function

  def prevent_stubout(rspec_config)
    rspec_config.before(:each) do
      unless example.metadata[:allow_stubout]
        begin
          RspecStubout.prevent_stub_on(described_class)
          RspecStubout.prevent_stub_on(subject)
        rescue => e
          warn "rspec stubout setup failed, possibly setup in another before(:each) has not run yet: #{e.backtrace[0]}, #{e.inspect}"
        end
      end
    end
  end

  def prevent_stub_on(o)
    unless o.nil?
      o.stub(:stub) { raise "#{o} is the object under test and should not be stubbed" }
    end
  end

end
