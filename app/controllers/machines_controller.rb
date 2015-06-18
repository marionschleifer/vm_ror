class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      redirect_to @machine, notice: 'Machine was successfully created.'
    else
      render :new
    end
  end

  def update
    @machine = Machine.find(params[:id])

    if @machine.update(machine_params)
      redirect_to @machine, notice: 'Machine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
      redirect_to machines_url, notice: 'Machine was successfully destroyed.'
  end

  def turn
    @machine = Machine.find(params[:id])
    @machine.turn!
    redirect_to @machine
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def machine_params
    params.require(:machine).permit(:name, :positions, :current_position)
  end
end
