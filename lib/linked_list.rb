class LinkedList
  include Comparable
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

  def indexOf(string)
    if @size == 0
      return nil
    end

    index = 0
    item = @first_item

  #move items until the current payload equals the string your looking for
    until item.payload == string
      item = item.next_list_item
      index += 1

  #if index == @size, the string was not found
      if index == @size
        index = nil
        break
      end
    end
    return index
  end

  def sorted?
    item = @first_item
    is_sorted = false
    index = 0

    if @size <= 1
      is_sorted = true
    else
      until index == @size or item.next_list_item == nil
        puts "INDEX IN UNTIL"
        puts index
        item2 = item.next_list_item
        is_sorted = item <= item2
        item = item.next_list_item
        index += 1
      end
    end

    puts ""
    puts "IS SORTED"
    puts is_sorted
    puts "INDEX"
    puts index
    is_sorted
  end

end
