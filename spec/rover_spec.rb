require_relative '../lib/rover'

describe Rover do

  context "should know what direction it is facing" do

    let (:rover) { Rover.new('N') }

    it 'should be facing northwards' do
      expect(rover.direction).to eq 'N'
    end

  end


end