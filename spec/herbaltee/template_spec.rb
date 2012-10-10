require 'spec_helper'
require 'tempfile'

describe "Herbaltee::Template" do
  describe "#render" do
    it "renders a template with given variables" do
      template = Herbaltee::Template.new('spec/fixtures/template.erb', {x: 42})
      template.render.should == "The value of x is: 42\n"
    end
  end
  describe "#write" do
    it "writes a rendered template" do
      template = Herbaltee::Template.new('spec/fixtures/template.erb', {x: 42})
      Tempfile.open('template') do |file|
        template.write(file.path)
        file.read.should == template.render
      end
    end
    it "creates a backup" do
      template = Herbaltee::Template.new('spec/fixtures/template.erb', {x: 42})
      template2 = Herbaltee::Template.new('spec/fixtures/template.erb', {x: 43})
      Time.stub(:now).and_return(Time.at(0))
      Tempfile.open('template') do |file|
        template.write(file.path)
        begin
          template2.write(file.path)
          file2 = [file.path, '19691231160000'].join('.')
          file.read.should == template2.render
          File.read(file2).should == template.render
        ensure
          File.delete(file2) if File.exists?(file2)
        end
      end
    end
  end
end
