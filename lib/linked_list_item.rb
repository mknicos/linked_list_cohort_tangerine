class LinkedListItem
  attr_accessor :payload
  attr_reader :next_list_item

  # called by LinkedListItem.new
  def initialize(payload)
    @payload = payload
    @next_list_item = nil
  end
  
  def next_list_item=(data)
    if data == self
      raise ArgumentError
    else
      @next_list_item = data
    end
  end

  def last?
    @next_list_item == nil
    #this returns true if next_list_item has not been set, aka, its last
  end


end
