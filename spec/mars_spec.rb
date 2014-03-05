require_relative '../lib/mars'

describe Mars do

  context 'should set its own size' do

    let(:mars) { Mars.new('55', '12N') }

    it 'should be a 6 by 6 grid' do
      expect(mars.plateau.length).to eq 6
      expect(mars.plateau.transpose.length).to eq 6
    end

  end

  context 'should be created with rovers' do
    
    let(:mars) { Mars.new('55','12N33E')}

    it 'should have a rover at co-ordinates ( 1, 2 )' do
      rover = mars.rovers[0]
      expect(rover.position).to eq([1, 2])
    end

    it 'should be able to have many rovers' do
      expect(mars.rovers.length). to eq 2
    end
    

  end

end