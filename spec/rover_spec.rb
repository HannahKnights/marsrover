require_relative '../lib/rover'

describe Rover do

  context 'should know what direction it is facing' do

    let (:rover) { Rover.new('N') }

    it 'should be facing northwards' do
      expect(rover.compass).to eq 'N'
    end

    it 'should be able to change direction' do
      rover.compass = 'S'
      expect(rover.compass).to eq 'S'
    end

    it 'should only be able to face North, South, East or West' do
      rover.compass = 'Z'
      expect(rover.compass).to eq 'N'
    end

  end

  context 'should be able to move' do


  end


end