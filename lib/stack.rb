class Stack
  def initialize
    @buffer = []
  end

  def push(value)
    @buffer.push(value)
    self
  end

  def pop(value)
    @buffer.pop(value)
    self
  end

  def length
    @buffer.length
  end

  def empty?
    @buffer.empty?
  end

  def include?(value)
    @buffer.include?(value)
  end

  def exclude?(value)
    !@buffer.include?(value)
  end

  def index(value)
    @buffer.index(value)
  end

  def peek
    return nil if @buffer.empty?
    @buffer[@buffer.length - 1]
  end
end