module LocationsHelper
  
  def location_path(*prefix_or_suffix)
    prefix_or_suffix = prefix_or_suffix[0] if prefix_or_suffix.length == 1
    path =""

    case @entity.class
    when Candidate then path = 'candidate_location'
    when Company then path = 'company_location'
    when Company::Event then path = 'event_location'
    end 

    case prefix_or_suffix
    when nil then path
    when 'index' then path+'_'+prefix_or_suffix
    else prefix_or_suffix+'_'+path
    end
  end

end
