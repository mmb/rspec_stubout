# encoding: UTF-8

require 'spec_helper'

class C
end

describe C do

  it 'raises an error when subject is stubbed' do
    expect {
      subject.stub(method1: 'foo')
    }.to raise_error(
             /<C.* is the object under test and should not be stubbed/)
  end

end
