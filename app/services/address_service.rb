class AddressService
  attr_reader :webservice

  TIMEOUT = 5

  def initialize(webservice: "http://cep.correiocontrol.com.br/")
    @webservice = webservice
  end

  def find_address_by_zipcode(zipcode, timeout = TIMEOUT)
    zipcode.gsub!(/\D/, '')

    if /\A\d{8}\z/.match zipcode
      response = open("#{webservice}/#{zipcode}.json").read

      return AddressInfo.from_json(response)
    end
  end

  class AddressInfo
    attr_reader :district, :address, :zipcode, :state, :city, :country

    def initialize(args = {})
      @district = args[:district]
      @address = args[:address]
      @zipcode = args[:zipcode]
      @state = args[:state]
      @city = args[:city]
      @country = "Brasil"
    end

    def self.from_json(address)
      parsed_address = JSON.parse(address, { symbolize_names: true })

      if [:bairro, :logradouro, :cep, :uf, :localidade].all? { |key| parsed_address.has_key? key }
        new(
          district: parsed_address[:bairro],
          address: parsed_address[:logradouro],
          zipcode: parsed_address[:cep],
          state: parsed_address[:uf],
          city: parsed_address[:localidade]
        )
      end
    rescue JSON::ParserError
    end

    def to_json
      {
        district: self.district,
        address: self.address,
        city: self.city,
        zipcode: self.zipcode,
        state: self.state,
        country: self.country
      }.to_json
    end
  end
end
