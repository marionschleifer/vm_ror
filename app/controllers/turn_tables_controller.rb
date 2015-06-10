class TurnTablesController < ApplicationController
  before_action :set_turn_table, only: [:show, :edit, :update, :destroy]

  # GET /turn_tables
  # GET /turn_tables.json
  def index
    @turn_tables = TurnTable.all
  end

  # GET /turn_tables/1
  # GET /turn_tables/1.json
  def show
  end

  # GET /turn_tables/new
  def new
    @turn_table = TurnTable.new
  end

  # GET /turn_tables/1/edit
  def edit
  end

  # POST /turn_tables
  # POST /turn_tables.json
  def create
    @machine = Machine.find(params[:turn_table][:machine_id])
    @turn_table = TurnTable.new(turn_table_params)
    respond_to do |format|
      if @turn_table.save
        @machine.positions.times do
          @turn_table.sections.create
        end
        format.html { redirect_to @machine, notice: 'Turn table was successfully created.' }
        format.json { render :show, status: :created, location: @turn_table }
      else
        format.html { render :new }
        format.json { render json: @turn_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_tables/1
  # PATCH/PUT /turn_tables/1.json
  def update
    respond_to do |format|
      if @turn_table.update(turn_table_params)
        format.html { redirect_to @turn_table, notice: 'Turn table was successfully updated.' }
        format.json { render :show, status: :ok, location: @turn_table }
      else
        format.html { render :edit }
        format.json { render json: @turn_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_tables/1
  # DELETE /turn_tables/1.json
  def destroy
    @turn_table.destroy
    respond_to do |format|
      format.html { redirect_to turn_tables_url, notice: 'Turn table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn_table
      @turn_table = TurnTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turn_table_params
      params.require(:turn_table).permit(:open, :machine_id)
    end

end
