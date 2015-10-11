require 'spec_helper'
require 'plugins/pre_commit/checks/checkstyle'

describe PreCommit::Checks::Checkstyle do
  let(:config) {double(PreCommit::Configuration, get: '')}
  let(:check) {PreCommit::Checks::Checkstyle.new(nil, config, [])}

  it "succeds if nothing changed" do
    expect(check.call([])).to be_nil
  end

  it "succeeds for good code" do
    files = [fixture_file('good.java')]
    expect(check.call(files)).to be_nil
  end

  it "should fail for bad formatted code" do
    file = fixture_file("bad.java")

    result = check.call([file])
    
    expect(result).to include "File errors: #{file}"
    expect(result).to include "line: 1: error:"
    expect(result).to include "line: 1:1 error:"
    expect(result).to include "line: 2:3 error:"
    expect(result).to include "line: 2:27 error:"
  end


  it "should accept multiple fails" do
    # given
    file = fixture_file("bad.java")
    file2 = fixture_file("bad2.java")
    
    # when 
    result = check.call([file, file2]) 
    
    # then
    expect(result).to include "File errors: #{file}"
    expect(result).to include "File errors: #{file2}"
  end

  it "should accept custom checkstyle" do
    # given
    files = [fixture_file('good.java')]
    custom_config = double(PreCommit::Configuration,
                           get: fixture_file('google_checks.xml'))
    # when
    check.config = custom_config
    # then
    expect(check.call(files)).to be_nil
  end
end
