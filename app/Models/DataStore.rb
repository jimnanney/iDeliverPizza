class DataStore
  def self.shared
    @shared ||= DataStore.new
  end

  def shifts
    @shifts
  end

  def tips
    @tips
  end

  private

  def initialize
    @shifts = []
    class << @shifts
      def <<(other)
        super(other)
        # not the most efficeint to sort after each append, but for small array should be fine
        sort_by!{|shift| shift.date.timeIntervalSince1970 * -1}
      end
    end

    sample_shifts_data(0)

    @tips = []
    class << @tips
      def <<(other)
        # always prepend rather than append
        insert(0,other)
      end
    end
  end

  def sort_shifts
    @shifts.sort_by!{|shift| shift.date.timeIntervalSince1970 * -1}
  end

  def sample_shifts_data(count)
    count.times { |n| @shifts << Shift.new(NSDate.dateWithTimeIntervalSinceNow(-86400 * n)) }
  end
end