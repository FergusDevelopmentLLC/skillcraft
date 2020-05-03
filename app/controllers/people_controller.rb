class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    #binding.pry
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    #binding.pry
  end

  # GET /people/new
  def new
    #binding.pry
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    #binding.pry
  end

  # POST /people
  # POST /people.json
  def create

    #binding.pry
    
    @person = Person.new(person_params)
    respond_to do |format|
      if(@person.valid?)
        if @person.save
          format.html { redirect_to @person, notice: 'Person was successfully created.' }
          format.json { render :show, status: :created, location: @person }
        else
          format.html { render :new }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end  
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update

    #binding.pry
    
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    #binding.pry
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:user_name, :type, :password, :first_name, :last_name, :email)
    end
end
