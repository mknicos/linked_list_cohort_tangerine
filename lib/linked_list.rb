class LinkedList
  attr_reader :size

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
    # find current next_list_item
    item = @first_item
    puts item.next_list_item
    index.times {item = item.next_list_item}

    puts ""
    puts "item.next_list_item"
    puts "item"
    puts item
    puts item.next_list_item

    current_next_item = item.next_list_item

    puts item.next_list_item

    #change previous item in list's next_list_item
    item2 = @first_item
    index -= 1
    index.times {item2 = item.next_list_item}
    item2.next_list_item = current_next_item
    puts ""
    puts "item.next_list_item"
    puts item2.next_list_item

    #reduce size of list
    @size = @size - 1
  end

end
