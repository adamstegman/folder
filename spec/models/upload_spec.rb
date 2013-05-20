# coding: UTF-8

require 'spec_helper'

describe Upload do
  describe '#image?' do
    described_class::IMAGE_EXTENSIONS.each do |ext|
      it "is true for a filename ending in #{ext}" do
        subject.filename = "something.#{ext}"
        expect(subject).to be_image
      end
    end

    it 'is false for a filename ending in something else' do
      subject.filename = 'something.else'
      expect(subject).to_not be_image
    end
  end

  describe '#path' do
    it 'returns the filename in the upload directory' do
      subject.filename = 'something'
      expect(subject.path).to eq("/#{described_class::UPLOAD_DIR}/something")
    end
  end

  describe '.find(id)' do
    before(:each) do
      FileUtils.stub(:chdir).and_yield
    end

    it 'finds the first file with a basename match that exists in the upload directory' do
      Dir.stub(:[]).and_return(['something.one', 'something.else'])
      subject = described_class.find('something')
      expect(subject.id).to eq('something')
      expect(subject.filename).to eq('something.one')
    end

    it 'returns nil for a non-existent file' do
      Dir.stub(:[]).and_return([])
      expect(described_class.find('something')).to be_nil
    end
  end
end
