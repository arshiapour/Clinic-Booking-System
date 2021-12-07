class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /patients or /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1 or /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    #@patient = current_user.patients.build
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients or /patients.json
  def create
    @patient = Patient.new(patient_params)
    #@patient = current_user.patients.build(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: "Appointment was successfully created. A confirmation email has been sent to your email." }
        format.json { render :show, status: :created, location: @patient }
        #Send confirmation email
        UserMailer.appointmentConfirmation(@patient).deliver
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @patient = current_user.patients.find_by(id: params[:id])
    redirect_to patients_path, notice:"Access Denied" if @patient.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :email, :phone, :appointment_id, :user_id)
    end
end
