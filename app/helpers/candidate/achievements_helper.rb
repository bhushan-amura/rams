module Candidate::AchievementsHelper

  def achievement_path_params(achievement)
    {candidate_id:params[:candidate_id],id: achievement.id}
  end

end
