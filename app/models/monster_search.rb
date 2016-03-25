class MonsterSearch
  # Example the use
  # @profiles = MonsterSearch.new(Profile, params).search

  def initialize(model, params)
    @table = model
    @rows = []
    @array_search = params.split()
    @columns = model.columns_search
  end

  def search
    @table.joins_search.where( or_each ).order( order_each )
  end

  private
    def or_each
      @array_search.each do |val|
        @columns.each do |column|
          @rows << "#{column} ilike '%#{val}%'"
        end
      end
      @rows.join(" OR ")
    end

    def order_each
      @array_search.each do |val|
        @columns.each do |column|
          @rows << "#{column} ilike '%#{val}%' desc"
        end
      end
      @rows.join(", ")
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
end