require 'methodize_string'

describe "methodize" do
  context "empty string" do
    it "returns nil when #methodize called on an empty string" do
      expect("".methodize).to be_nil
    end

    it "raises ArgumentError when #methodize! called on an empty string" do
      expect { "".methodize! }.to raise_error(ArgumentError)
    end
  end

  context "blank string" do
    it "returns nil when #methodize called on an blank string" do
      expect(" ".methodize).to be_nil
    end

    it "raises ArgumentError when #methodize! called on an blank string" do
      expect { " ".methodize! }.to raise_error(ArgumentError)
    end
  end

  context "string starts with a number" do
    it "processes number with no leading or trailing chars" do
      expect("1".methodize).to eq("one")
    end

    it "processes number with leading and trailing chars" do
      expect(" 1 ".methodize).to eq("one")
    end

    it "doesn't process number with immediately trailing alpha chars" do
      expect("1st".methodize).to be_nil
    end

    it "processes number with trailing alpha chars separated by whitespace" do
      expect("1 day".methodize).to eq("one_day")
    end
  end

  context "accented chars" do
    it "converts accented chars to non-accented versions by default" do
      expect("Ä Ö Ü".methodize).to eq("a_o_u")
    end

    it "doesn't convert accented chars when transliteration is disabled" do
      expect("Ä Ö Ü".methodize(transliterate: false)).to eq("ä_ö_ü")
    end
  end
end
