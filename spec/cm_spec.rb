require 'spec_helper'

describe Cm::CLI do
  describe '--version' do
    it 'shows version' do
      cli = Cm::CLI.new
      output = capture(:stdout) { cli.__print_version }
      expect(output).to eq("cm version 0.1.0\n")
    end
  end

  describe 'convert' do
    it 'converts' do
      VCR.use_cassette('convert') do
        cli = Cm::CLI.new
        allow(cli).to receive(:options).and_return({ base: 'USD', target: 'EURO' })
        output = capture(:stdout) { cli.convert }
        expect(output).to eq("1 US dollar = 0.8927 euros\n")
      end
    end
  end
end
