require_relative '../lib/mars'

describe Mars do

  context 'should know its own size' do

    let(:mars) { Mars.new('55') }

    it 'should be a 5 by 5 grid' do

      expect(mars.plateau.length).to eq 6
      expect(mars.plateau.transpose.length).to eq 6

    end

  end

end