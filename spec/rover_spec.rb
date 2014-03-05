require_relative '../lib/rover'

describe Rover do
  
  context 'should know what direction it is facing' do
    
    let (:rover) { Rover.new('N', [1, 2]) }

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

    let (:rover) { Rover.new('N', [1, 2]) }

    it 'when starting' do
      expect(rover.position).to eq [1, 2]
    end

  end

  context 'should be able to navigate' do

    it 'by rotating 90 degrees right' do
      rover = Rover.new('N', [1,2], 'R')
      rover.set_off
      expect(rover.compass).to eq 'E'
    end

    it 'by rotating 90 degrees left' do
      rover = Rover.new('N', [1,2], 'L')
      rover.set_off
      expect(rover.compass).to eq 'W'
    end

    it 'by moving forward' do
      rover = Rover.new('N', [1,2], 'M')
      rover.set_off
      expect(rover.position).to eq [1, 3]
    end

    it 'by moving forward after rotating right' do
      rover = Rover.new('N', [1,2], 'RM')
      rover.set_off
      expect(rover.position).to eq [2, 2]
    end

    it 'by moving forward after rotating left' do
      rover = Rover.new('N', [1,2], 'LM')  
      rover.set_off
      expect(rover.position).to eq [0, 2]
    end

    it 'by moving forward after rotating south' do
      rover = Rover.new('N', [1,2], 'RRM')
      rover.set_off
      expect(rover.position).to eq [1, 1]
    end

    it 'complex directions' do
      rover = Rover.new('N', [1,2], 'LMLMLMLMM')
      rover.set_off
      expect(rover.position).to eq [1, 3]
      expect(rover.compass).to eq 'N'
    end

  end

end