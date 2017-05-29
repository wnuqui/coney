require 'cm/version'
require 'thor'
require 'mechanize'

module Cm
  class CLI < Thor
    URL = 'https://www.google.com/search?q=BASE+AMOUNT+to+TARGET'

    COMMAND = 'convert --base CURRENCY [--base-amount AMOUNT] --target CURRENCY'

    desc COMMAND, 'Convert base currency to target currency'

    method_option :base,        required: true, aliases: '-b',  desc: 'The base currency to convert'
    method_option :base_amount,                 aliases: '-a',  desc: 'The base amount to convert'
    method_option :target,      required: true, aliases: '-t',  desc: 'The target currency'

    def convert
      convert_via_google
    end

    map %w[--version -v] => :__print_version
    desc '--version, -v', 'Print the version'

    def __print_version
      puts 'cm version ' + Cm::VERSION.to_s
    end

    no_commands {
      def convert_currency_url
        url = URL
          .gsub(/BASE/, options[:base])
          .gsub(/TARGET/, options[:target])

        options[:base_amount] ? url.gsub(/AMOUNT/, options[:base_amount]) : url.gsub(/AMOUNT\+/, '')
      end

      def convert_via_google
        agent = Mechanize.new
        page = agent.get(convert_currency_url)
        doc = page.parser
        result = doc.xpath('//*[@id="ires"]/ol/table').children.children[2].children.children[0].children.text
        puts result
      end
    }
  end
end