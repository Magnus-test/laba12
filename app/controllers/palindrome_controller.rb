class PalindromeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def input
  end

  def view
    val = check_input()
    if val
      if elem = PalindromeData.find_by(num: val)
        res = { count: elem.count, num: elem.num, nums: elem.nums, sq: elem.squared }
      else
        count = 1
        res = [ [count, 1, 1] ]
        2.upto(val) do |num|
          if palindrome? (num**2)
            res.push [count += 1, num, num**2]
          end
        end

        data = PalindromeData.new 
        data.count = count
        data.num = val
        data.nums = res.map { |x| x[1] }.join(' ')
        data.squared = res.map { |x| x[2] }.join(' ')
        data.save
        res = { count: data.count, num: data.num, nums: data.nums, sq: data.squared }
      end
    else
      if is_numeric? params[:val]  
        res = 'Error. Input is negavite number or 0.'
      else
        res = 'Error. Input is not a number.'
      end
    end  
    @result = res   
  end

  def showDB
    elems = []
    PalindromeData.all.each { |x| elems << {num: x.num, count: x.count, nums: x.nums, squared: x.squared} }
    render xml: elems.to_xml
  end

  private 
  def palindrome? num
    num == num.to_s.reverse.to_i
  end

  def is_numeric? obj 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def check_input
    unless is_numeric? params[:val] and params[:val].to_i.positive?
      return false
    else 
      return params[:val].to_i
    end
  end
end