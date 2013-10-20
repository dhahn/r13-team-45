namespace :recur do
  task :chore_list_items => :environment do
    ChoreListRecurringItem.all.each do |chore|
      if chore.value
        case chore.interval
        when "Weekly"
          if Time.now.strftime("%u").to_i == chore.specific_day_of
            chore.reset_completion
          end
        when "Monthly"
          if Time.now.strftime("%e").to_i == chore.specific_day_of
            chore.reset_completion
          end
        end
      end
    end
  end

  task :bills => :environment do
    Bill.all_recurring.each do |bill|
      case bill.interval
      when "Weekly" 
        if Time.now.strftime("%u").to_i == bill.specific_day_of
          bill.reset_completion
        end
      when "Monthly"
        if Time.now.strftime("%e").to_i == bill.specific_day_of
          bill.reset_completion
        end
      end
    end
  end
end
