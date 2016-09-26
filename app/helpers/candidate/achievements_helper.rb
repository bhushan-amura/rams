module Candidate::AchievementsHelper

  def achievement_path_params
    {candidate_id:params[:candidate_id],id:@candidate_achievement.id}
  end

end
