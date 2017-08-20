describe Coney::CLI do
  let(:cli) { Coney::CLI.new }

  describe '--version' do
    it 'shows version' do
      output = capture(:stdout) { cli.__print_version }
      expect(output).to match(/coney version [\d\.\d\.\d]/)
    end
  end

  describe 'convert' do
    it 'converts' do
      VCR.use_cassette('convert') do
        allow(cli).to receive(:options).and_return({ base: 'USD', target: 'EURO' })
        output = capture(:stdout) { cli.convert }
        expect(output).to eq("1 US dollar = 0.8503 euros\n")
      end
    end
  end
end
