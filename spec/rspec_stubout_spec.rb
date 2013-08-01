# encoding: UTF-8

require 'spec_helper'

describe RspecStubout do

  subject { 'subject' }

  context 'sending stub to subject' do

    it 'raises an error' do
      expect {
        subject.stub(method1: 'foo')
      }.to raise_error(
               'subject is the object under test and should not be stubbed')
    end

  end

  context 'sending stub_chain to subject' do

    it 'raises an error' do
      expect {
        subject.stub_chain(:method1, :method2) { 'foo' }
      }.to raise_error(
               'subject is the object under test and should not be stubbed')
    end

  end

  context 'when subject is not stubbed directly' do

    let(:object) { 'subject' }
    subject { object }

    it 'raises an error' do
      expect {
        object.stub(method1: 'foo')
      }.to raise_error(
               "subject is the object under test and should not be stubbed")
    end

  end

  context 'when using a named subject' do

    subject(:object) { 'subject' }

    it 'raises an error' do
      expect {
        object.stub(method1: 'foo')
      }.to raise_error(
               "subject is the object under test and should not be stubbed")
    end

  end

  context 'when the spec is tagged with allow_stubout' do

    it 'does not raise an error when subject is stubbed',
       allow_stubout: true do
      subject.stub(method1: 'foo')
    end

  end

  context 'when subject requires setup in group before(:each)' do

    before(:each) do
      @a = 1
    end

    subject {
      raise if @a.nil?
      'subject'
    }

    it 'does not raise an error' do
      subject.stub(method1: 'foo')
    end

  end

end
