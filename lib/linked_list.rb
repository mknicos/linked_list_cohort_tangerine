class LinkedList
  attr_reader :size
  attr_writer :first_item

  def initialize(*items)
    @size = 0
    if items
      items.each {|item| add_item(item)}
    else
      items = nil
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_list_item
      end
      item.next_list_item = lli
    end
    @size += 1
  end

  def get(i)
    raise IndexError if (i < 0) or (i  >= size)
    item = @first_item
    i.times do
      item = item.next_list_item
    end
    item.payload
  end

  def size
    @size
  end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def to_s
    result = "|"
    item = @first_item
    until item.nil?
      result << " " + item.payload
      result << "," unless item.last?
      item = item.next_list_item
    end
    result + " |"
  end

  def [](key)
    get(key)
  end

  def []=(index, new_payload)
    item = @first_item
    index.times do
      item = item.next_list_item
    end
    item.payload = new_payload
  end

  def remove(index)
    item = @first_item

    #error if trying to delete negative num, or greater than length of list
    raise IndexError if (index < 0) or (index >= @size)

    if index != 0
    # go to item previous to one being deleted
      (index-1).times {item = item.next_list_item}
      item.next_list_item = item.next_list_item.next_list_item
    else
    #you are removing first item in list
      item = item.next_list_item
      @first_item = item
    end

    #reduce size of list
    @size = @size - 1
  end

end
