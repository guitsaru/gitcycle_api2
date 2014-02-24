require 'spec_helper'

describe UpdateBranch do

  describe "#update" do

    let(:track) { Track.new({}) }

    it "creates updaters" do
      UpdateBranch::UPDATERS.each do |path|
        klass_str = File.basename(path, ".rb").classify
        klass     = Object.const_get("UpdateBranch::#{klass_str}")
        updater   = double(klass_str)

        klass.should_receive(:new).ordered.and_return(updater)
        updater.should_receive(:update?).ordered.and_return(false)
      end
      
      UpdateBranch.new(track.find_branch).update
    end
  end
end