class TurnTablesController < ApplicationController
  before_action :set_turn_table, only: [:show, :edit, :update, :destroy]

  def new
    @turn_table = TurnTable.new
  end

  def create
    @machine = Machine.find(params[:turn_table][:machine_id])
    @turn_table = TurnTable.new(turn_table_params)
    respond_to do |format|
      if @turn_table.save
        @machine.positions.times do
          @turn_table.sections.create
        end
        format.html { redirect_to service_machine_path(@machine), notice: 'Turn table was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def set_turn_table
    @turn_table = TurnTable.find(params[:id])
  end

  def turn_table_params
    params.require(:turn_table).permit(:open, :machine_id)
  end

end
