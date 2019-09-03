require 'spec_helper'

describe 'When a learning to build AoH,' do
  it 'the assembled_aoh method returns an AoH made from two constants' do
    result = [{:name=>"Don Gately", :occupation=>"Live-in Staff"},
       {:name=>"Joelle van Dyne", :occupation=>"Radio Personality"},
       {:name=>"Pat Monteseian", :occupation=>"Staff"},
       {:name=>"Kate Gompert", :occupation=>"None"},
       {:name=>"Bruce Green", :occupation=>"Fan of Mildred"}]
    expect(assembled_aoh).to eq(result)
  end

  it 'the literal_aoh method returns an AoH made made from a literal with sorted elements' do
    result = [{:name=>"Don Gately", :occupation=>"Live-in Staff"},
       {:name=>"Joelle van Dyne", :occupation=>"Radio Personality"},
       {:name=>"Pat Monteseian", :occupation=>"Staff"},
       {:name=>"Kate Gompert", :occupation=>"None"},
       {:name=>"Bruce Green", :occupation=>"Fan of Mildred"}]
    expect(literal_aoh).to eq(result)
  end
end

describe 'When a learning to perform lookups in AoHs,' do
  describe 'when given a aoh, row, and column argument,' do
    it 'the aoh_lookup method returns the requested value' do
      expect(aoh_lookup(assembled_aoh, 2, :name)).to eq("Pat Monteseian")
    end 
  end 
end

describe 'When a learning to update cells in AoHs,' do
  describe 'when given a AoH, row, column, and new_value argument,' do
    it 'the aoh_update method returns an updated aoh' do
      local_copy_of_aoh = assembled_aoh.dup
      result = aoh_update(local_copy_of_aoh, 1, :name, "Joelle van Dyne (PGOAT)")
      expect(result[1][:name]).to eq("Joelle van Dyne (PGOAT)")
    end
  end
end
