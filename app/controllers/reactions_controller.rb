class ReactionsController < ApplicationController
end
class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @catch = Catch.find(params[:catch_id])
    @reaction = @catch.reactions.build(reaction_params.merge(user: current_user))
    if @reaction.save
      redirect_to catch_path(@catch), notice: "Reacted!"
    else
      redirect_to catch_path(@catch), alert: "Could not react."
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:emoji)
  end
end
