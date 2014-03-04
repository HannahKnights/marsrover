require_relative '../lib/rover'

describe Rover do

  context "should know what direction it is facing" do

    let (:rover) { Rover.new('N') }

    it 'should be facing northwards' do
      expect(rover.direction).to eq 'N'
    end

    it 'should be able to change direction' do
      rover.direction = 'S'
      expect(rover.direction).to eq 'S'
    end

    it 'should only be able to face North, South, East or West' do
      rover.direction = 'Z'
      expect(rover.direction).to eq 'N'
    end

  end


end