# encoding: UTF-8

module RspecStubout

  module_function

  def prevent_stubout(rspec_config)
    rspec_config.before(:each) do
      unless example.metadata[:allow_stubout]
        subject.stub(:stub) do
          raise "#{subject.inspect} is the object under test and should not be stubbed"
        end
      end
    end
  end

end
