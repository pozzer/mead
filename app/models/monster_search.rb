class MonsterSearch
  # Example the use
  # @profiles = MonsterSearch.new(Profile, params).search

  def initialize(model, params)
    @table = model
    @rows = []
    @orders = []
    @array_search = get_params(params)
    @columns = model.columns_search
  end

  def search
    [@table.joins_search.where( or_each ).order( order_each ), @table.joins_search.tagged_with(@array_search)].inject(:union)
  end

  private
    def or_each
      rows = []
      @array_search.each do |val|
        @columns.each do |column|
          rows << "#{column} ilike '%#{val}%'"
        end
      end
      rows.join(" OR ")
    end

    def order_each
      @array_search.each do |val|
        @columns.each do |column|
          @orders << "#{column} ilike '%#{val}%' desc"
        end
      end
      @orders.join(", ")
    end

    def array_search
      @array_search
    end

    def hash
      @hash
    end

    def table
      @table.arel_table
    end

    def get_params(param)
      array = param.split()
      if array.size > 1
        array.insert(0,param)
      end
      array
    end
end
