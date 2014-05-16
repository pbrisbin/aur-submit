require 'net/https'
require 'nokogiri'
require 'uri'

class AurSubmit
  AUR = 'aur.archlinux.org'

  HTTP = Net::HTTP.new(AUR, 443)
  HTTP.use_ssl = true

  def self.run(username, password, category, file)
    new(username, password, category).submit(file)
  rescue => ex
    $stderr.puts "Error: (#{ex.class}) #{ex.message}"
    exit 1
  end

  def initialize(username, password, category)
    @cookie = HTTP.post('/login', parameterize({
      user: username, passwd: password, remember_me: 1,
    }))['Set-cookie']

    resp = HTTP.get('/submit', 'Cookie' => @cookie)
    html = Nokogiri::HTML(resp.body)

    @token = html.css('input[name=token]').first.attributes['value'].value

    html.css('select[name=category] option').each do |option|
      if category == option.children.to_s
        @category_id = option.attributes['value'].value.to_i
      end
    end

    @token       or raise "Authentication failure"
    @category_id or raise "Invalid category"
  end

  def submit(file)
    system(
      "/usr/bin/curl -#" \
      " -H 'Expect:'" \
      " -H 'Cookie: #{@cookie}'" \
      " -F token='#{@token}'" \
      " -F category=#{@category_id}" \
      " -F pfile=@'#{file}'" \
      " -F pkgsubmit=1" \
      " 'https://#{AUR}/submit' >/dev/null"
    ) or raise "Curl failed"
  end

  private

  def parameterize(params)
    URI.escape(params.map{ |k,v| "#{k}=#{v}" }.join('&'))
  end
end
