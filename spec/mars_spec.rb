require_relative '../lib/mars'

describe Mars do

  let(:mars) { Mars.new('55','12NLMLMLMLMM33EMMRMMRMRRM')}

  context 'should set its own size' do

    it 'should be a 6 by 6 grid' do
      expect(mars.plateau.length).to eq 6
      expect(mars.plateau.transpose.length).to eq 6
    end

  end

  context 'should be created with rovers' do
    
    it 'should have a rover at co-ordinates ( 1, 2 )' do
      rover = mars.rovers[0]
      expect(rover.position).to eq([1, 2])
    end

    it 'should be able to have many rovers' do
      expect(mars.rovers.length). to eq 2
    end

  end

  context 'completing missions' do

    it 'should know the finishing position of the rovers' do
      expect(mars.launch_mission).to eq(['13N', '51E'])
    end

  end

end