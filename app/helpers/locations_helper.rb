module LocationsHelper
  
  def location_path(*prefix_or_suffix)
    prefix_or_suffix = prefix_or_suffix.length == 1 ? prefix_or_suffix[0] : nil

    if @entity.class == Candidate then path = 'candidate_location'
    elsif @entity.class ==  Company then path =  'company_location'
    elsif @entity.class ==  Company::Event then path='event_location'
    end 

    case prefix_or_suffix
    when nil then path+'_path'
    else prefix_or_suffix+'_'+path+'_path'
    end
  end

end
