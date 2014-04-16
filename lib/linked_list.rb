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

  #[] is the same as the get method
  alias [] get

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
      @first_item = @first_item.next_list_item
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
    is_sorted = false
    index = 0

    if @size <= 1
      return true
    else
    item = @first_item
    #until loops until end of list, because at the end the next item is nil
      until item.next_list_item == nil
        is_sorted = item <= item.next_list_item
          if is_sorted == false
            return false
          end
        item = item.next_list_item
        index += 1
      end
    end
    return is_sorted
  end


  def swap_with_next(index)
    if index == @size -1
      raise IndexError
    end
    item1 = get_item(index)
    next_item = item1.next_list_item

    if index == 0
      @first_item = item1.next_list_item
      item1.next_list_item = item1.next_list_item.next_list_item
    else
      prev_item = get_item(index - 1)
      prev_item.next_list_item = next_item
      item1.next_list_item = item1.next_list_item.next_list_item
    end
    next_item.next_list_item = item1
  end

  def sort
    counter_index = 0
    x =  self.sorted?
    puts
    puts "THIS IS SOMETHING"
    puts x
    until self.sorted?
      puts ""
      puts "NOT SORTED"
      item1 = get_item(counter_index)
      item2 = get_item(counter_index + 1)
      if item1 < item2
        counter_index += 1
      else
        swap_with_next(counter_index)
        counter_index = 0
      end
    end
    self
  end


#------------PRIVATE-------------------#
  private

  def get_item(i)
    raise IndexError if i < 0 or i >= size
    item = @first_item
    i.times do
      item = item.next_list_item
    end
    item
  end
end
