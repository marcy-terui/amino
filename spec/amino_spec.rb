require 'spec_helper'
require 'amino'

describe Amino do
  before do
    @amino = Amino('name' => 'amzn-ami-hvm-*-gp2', 'virtualization-type' => 'hvm')
  end

  example { expect(@amino.last.image_id).to eq "ami-1ecae776" }
  example { expect(@amino.first.image_id).not_to eq "ami-1ecae776" }
end
