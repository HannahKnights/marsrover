require_relative '../lib/rover'

describe Rover do
  
  context 'orientation' do
    
    let (:rover) { Rover.new('N', [1, 2]) }

    it 'should know what co-ordinate it is at' do
      expect(rover.position).to eq [1, 2]
    end

    it 'should know it is facing northwards' do
      expect(rover.orientation).to eq 'N'
    end

    it 'should be able to change direction' do
      rover.orientation = 'S'
      expect(rover.orientation).to eq 'S'
    end

    it 'should only be able to face North, South, East or West' do
      rover.orientation = 'Z'
      expect(rover.orientation).to eq 'N'
    end

  end

  context 'should be able to navigate' do

    it 'by rotating 90 degrees right' do
      rover = Rover.new('N', [1,2], 'R')
      rover.set_off
      expect(rover.orientation).to eq 'E'
    end

    it 'by rotating 90 degrees left' do
      rover = Rover.new('N', [1,2], 'L')
      rover.set_off
      expect(rover.orientation).to eq 'W'
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
      expect(rover.orientation).to eq 'N'
    end

  end

end