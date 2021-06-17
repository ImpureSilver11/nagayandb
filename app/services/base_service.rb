class BaseService
  attr_accessor :params, :result

  def initialize(params)
    @params = params
  end
end
