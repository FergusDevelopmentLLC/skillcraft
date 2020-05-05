class PeopleController < ApplicationController
    
    # POST /people
    # POST /people.json
    def create
        @person = Person.new(person_params)
        respond_to do |format|
            if @person.save
                format.html { redirect_to courses_url, notice: "#{@person.type} was successfully created." }
                #format.json { render :show, status: :created, location: @student } //TODO: fix
            else
                format.html { render :new }
                #format.json { render json: @student.errors, status: :unprocessable_entity } //TODO: fix
            end
        end
    end

    private
        
        # Only allow a list of trusted parameters through.
        def person_params
            params.require(:person).permit(:user_name, :id, :password_digest, :first_name, :last_name, :email, :type)
        end

end