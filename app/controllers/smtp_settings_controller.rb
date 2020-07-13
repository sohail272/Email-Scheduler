class SmtpSettingsController < ApplicationController
  before_action :set_smtp_setting, only: [:show, :edit, :update, :destroy]

  # GET /smtp_settings
  # GET /smtp_settings.json
  def index
    @smtp_settings = admin_signed_in? ? SmtpSetting.all : (current_user.smtp_setting.nil? ? [] : current_user.smtp_setting)
  end

  # GET /smtp_settings/1
  # GET /smtp_settings/1.json
  def show
  end

  # GET /smtp_settings/new
  def new
    @smtp_setting = SmtpSetting.new
  end

  # GET /smtp_settings/1/edit
  def edit
  end

  # POST /smtp_settings
  # POST /smtp_settings.json
  def create
    @smtp_setting = current_user.build_smtp_setting(smtp_setting_params)

    respond_to do |format|
      if @smtp_setting.save
        format.html { redirect_to @smtp_setting, notice: 'Smtp setting was successfully created.' }
        format.json { render :show, status: :created, location: @smtp_setting }
      else
        format.html { render :new }
        format.json { render json: @smtp_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smtp_settings/1
  # PATCH/PUT /smtp_settings/1.json
  def update
    respond_to do |format|
      if @smtp_setting.update(smtp_setting_params)
        format.html { redirect_to @smtp_setting, notice: 'Smtp setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @smtp_setting }
      else
        format.html { render :edit }
        format.json { render json: @smtp_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smtp_settings/1
  # DELETE /smtp_settings/1.json
  def destroy
    @smtp_setting.destroy
    respond_to do |format|
      format.html { redirect_to smtp_settings_url, notice: 'Smtp setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smtp_setting
      @smtp_setting = SmtpSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smtp_setting_params
      # params.fetch(:smtp_setting, {})
      params.require(:smtp_setting).permit(:address, :port, :username, :password)
    end
end
