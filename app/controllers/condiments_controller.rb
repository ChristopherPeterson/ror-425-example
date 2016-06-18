class CondimentsController < ApplicationController
  before_action :set_condiment, only: [:show, :edit, :update, :destroy]

  # GET /condiments
  # GET /condiments.json
  def index
    @condiments = Condiment.all
  end

  # GET /condiments/1
  # GET /condiments/1.json
  def show
  end

  # GET /condiments/new
  def new
    @condiment = Condiment.new
  end

  # GET /condiments/1/edit
  def edit
  end

  # POST /condiments
  # POST /condiments.json
  def create
    @condiment = Condiment.new(condiment_params)

    respond_to do |format|
      if @condiment.save
        format.html { redirect_to @condiment, notice: 'Condiment was successfully created.' }
        format.json { render :show, status: :created, location: @condiment }
      else
        format.html { render :new }
        format.json { render json: @condiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condiments/1
  # PATCH/PUT /condiments/1.json
  def update
    respond_to do |format|
      if @condiment.update(condiment_params)
        format.html { redirect_to @condiment, notice: 'Condiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @condiment }
      else
        format.html { render :edit }
        format.json { render json: @condiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condiments/1
  # DELETE /condiments/1.json
  def destroy
    @condiment.destroy
    respond_to do |format|
      format.html { redirect_to condiments_url, notice: 'Condiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condiment
      @condiment = Condiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condiment_params
      params.require(:condiment).permit(:survey_food_code, :display_name, :portion_size, :portion_code, :grains, :whole_grains, :vegetables, :dkgreen, :orange, :starchy_vegetables, :other_vegetables, :fruits, :milk, :meat, :soy, :drybeans_peas, :oils, :solid_fats, :added_sugars, :alcohol, :calories, :saturated_fats)
    end
end
