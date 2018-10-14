class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================
    
    @sorted_numbers = @numbers.sort
    sort_arr=@sorted_numbers
    
    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum-@minimum

    len=@count
    # Median
    
   if(len %2==1)
      mid=sort_arr.at(len/2)
      else
       mid=0.5*sort_arr.at(len/2)+ 0.5*sort_arr.at((len/2)-1)
    end  
   
    # ======

    @median = mid
    @sum = sort_arr.sum

    @mean = @sum/@count.to_f
    
    # Variance
    
     i=0
     var=0
     
    
    #while(i<len)
     #var=var+(sort_arr[i]-@mean)**2
      #i=i+1
    #end
    # ========

    #@variance = v

    @standard_deviation = "Replace this string with your answer"

    # Mode
    # ====

    @mode = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
