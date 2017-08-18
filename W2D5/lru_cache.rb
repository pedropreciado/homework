class LRUCache

  def initialize(size)
    @size = size
    @cache = Array.new(size)
  end

  def count
    @cache.count
    @cache.show
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache << el
      @cache.shift
    end
  end

  def show
    print @cache
  end

  private

end
