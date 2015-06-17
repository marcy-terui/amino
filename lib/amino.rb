require "amino/version"
require "aws-sdk"

def Amino(conds, opts={})
  Amino::Images.new(conds, opts)
end

module Amino
  class Images

    def initialize(conds, opts={})
      filters = []
      conds.each {|k,v| filters << {name: k, values: Array(v)} }

      @images = ::Aws::EC2::Client.new(opts).describe_images(
        filters: filters
      ).images
    end

    def first
      sort_by_creation_date.first
    end

    def last
      sort_by_creation_date.last
    end

    private

    def sort_by_creation_date
      @images.sort_by {|img| img.creation_date }
    end
  end

end
