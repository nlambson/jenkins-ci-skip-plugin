require 'spec_helper'

describe WIPSkip::Matcher do
  describe '#skip?' do
    it 'should not skip' do
      messages = [
        "initial commit",
        "foo [ci unknown-command] bar"
      ]
      messages.each do |message|
        expect(described_class.new(message).skip?).to eq false
      end
    end

    it 'should skip' do
      messages = [
        "foo wip bar",
        "foo WIP bar",
        "foo bar \n\nWIP"
      ]
      messages.each do |message|
        expect(described_class.new(message).skip?).to eq true
      end
    end
  end
end
