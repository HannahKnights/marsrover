require_relative '../lib/rover'

describe Rover do
  
  let (:rover) { Rover.new('N', [1, 2]) }

  context 'should know what direction it is facing' do

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

  context 'knowing what co-ordinates it is at' do

    it 'when starting' do
      expect(rover.position).to eq [1, 2]
    end

  end

  context 'should be able to navigate' do

    it 'by rotating 90 degrees right' do
      rover.set_off('R')
      expect(rover.compass).to eq 'E'
    end

    it 'by rotating 90 degrees left' do
      rover.set_off('L')
      expect(rover.compass).to eq 'W'
    end

    it 'by moving forward' do
      expect(rover.position).to eq [1, 2]
      rover.set_off('M')
      expect(rover.position).to eq [1, 3]
    end


  end


end