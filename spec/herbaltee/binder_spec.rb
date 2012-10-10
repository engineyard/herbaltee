require 'spec_helper'

describe "Herbaltee::Binder" do
  it "makes an object with callable attributes from a given hash" do
    binder = Herbaltee::Binder.new({foo: 'foo', derp: 'derp'})
    binder.foo.should == 'foo'
    binder.derp.should == 'derp'
  end
  it "prevents invalid attribute names" do
    expect { Herbaltee::Binder.new({method_missing: "nope"}) }.to raise_error
  end
end
