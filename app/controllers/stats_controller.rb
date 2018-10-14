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
    ave=@mean
    
    # Variance
    

     diff_arr= [] #create an empty array to measure difference b/w original number and variance whole squared
     
     sort_arr.each do |num|
         sq_diff=((num-ave)**2) #calculating square of difference
         diff_arr.push(sq_diff) #Pushing the difference values into diff_arr
     end
     
     @variance=diff_arr.sum/@count.to_f
    
    #while(i<len)
     #var=var+(sort_arr[i]-@mean)**2
      #i=i+1
    #end
    # ========


    @standard_deviation = (@variance)**0.5

    # Mode
    
    max=1
    ctr=1
    i=1
    mode_temp=sort_arr[0]
    
    while(i<len)
        if(sort_arr[i]==sort_arr[i-1])
            ctr=ctr+1
            i=i+1
        elsif(max<ctr)
            max=ctr
            mode_temp=sort_arr[i-1]
            ctr=1
            i=i+1
        else
            ctr=1
            i=i+1
        end
    end
    
    if(max<ctr)
        @mode=sort_arr[len-1]
    else
        @mode=mode_temp
    end
    # ====

    

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
