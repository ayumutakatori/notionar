module Notionar
  class Client
    def initialize(token)
      endpoint = "https://api.notion.com/"
      @version  = "v1"

      url = URI.parse(endpoint)
      @http = Net::HTTP.new(url.host, url.port)
      @http.use_ssl = true
      @headers = {
        "Authorization" => "Bearer #{token}",
        "Content-Type"  => "application/json",
        "Notion-Version" =>  "2021-05-13",
      }
    end

    def users
      @path = "/#{@version}/users"
      request(:get)
    end

    def user(user_id)
      @path = "/#{@version}/users/#{user_id}"
      request(:get)
    end

    def page(page_id)
      @path = "/#{@version}/pages/#{page_id}"
      request(:get)
    end

    def search(query)
      @path = "/#{@version}/search"
      @params = {
        query: query,
      }

      request(:post)
    end

    def database(database_id)
      @path = "/#{@version}/databases/#{database_id}"
      request(:get)
    end

    def query_database(database_id, property_name, query)
      @path = "/#{@version}/databases/#{database_id}/query"
      @params = {
        filter: {
          property: property_name,
          select: {
            equals: query
          }
        }
      }
      request(:post)
    end

    private

    def request(method)
      response =
        case method
        when :get
          @http.get(@path, @headers)
        when :post
          @http.post(@path, JSON.generate(@params), @headers)
        else
          raise "Unknown method - #{method}"
        end

      { body: JSON.parse(response.body), code: response.code }
    end
  end
end