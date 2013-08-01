# encoding: UTF-8

module RspecStubout

  module_function

  def prevent_stubout(rspec_config)
    rspec_config.before(:each) do
      unless example.metadata[:allow_stubout]
        begin
          described_class.stub(:stub) do
            raise "#{described_class} is the object under test and should not be stubbed"
          end

          subject.stub(:stub) do
            raise "#{subject} is the object under test and should not be stubbed"
          end
        rescue => e
          warn "rspec stubout setup failed, possibly setup in another before(:each) has not run yet: #{e.inspect}"
        end
      end
    end
  end

end
