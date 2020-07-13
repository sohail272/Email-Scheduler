class ScheduledEmailsController < ApplicationController
  before_action :set_scheduled_email, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_emails
  # GET /scheduled_emails.json
  def index
    @scheduled_emails = admin_signed_in? ? ScheduledEmail.all : current_user.scheduled_emails
  end

  # GET /scheduled_emails/1
  # GET /scheduled_emails/1.json
  def show
  end

  # GET /scheduled_emails/new
  def new
    @scheduled_email = ScheduledEmail.new
  end

  # GET /scheduled_emails/1/edit
  def edit
  end

  # POST /scheduled_emails
  # POST /scheduled_emails.json
  def create
    @scheduled_email = current_user.scheduled_emails.new(scheduled_email_params)

    respond_to do |format|
      if @scheduled_email.save
        MailerWorker.perform_in(5.seconds, @scheduled_email.id, current_user.id)
        format.html { redirect_to @scheduled_email, notice: 'Scheduled email was successfully created.' }
        format.json { render :show, status: :created, location: @scheduled_email }
      else
        format.html { render :new }
        format.json { render json: @scheduled_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_emails/1
  # PATCH/PUT /scheduled_emails/1.json
  def update
    respond_to do |format|
      if @scheduled_email.update(scheduled_email_params)
        MailerWorker.perform_in(5.seconds, @scheduled_email.id, current_user.id)
        format.html { redirect_to @scheduled_email, notice: 'Scheduled email was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduled_email }
      else
        format.html { render :edit }
        format.json { render json: @scheduled_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_emails/1
  # DELETE /scheduled_emails/1.json
  def destroy
    @scheduled_email.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_emails_url, notice: 'Scheduled email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_email
      @scheduled_email = ScheduledEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduled_email_params
      # params.fetch(:scheduled_email, {:send_to, :subject, :body, :sending_time, :status})
      params.require(:scheduled_email).permit(:send_to, :subject, :body)#, :sending_time)
    end
end
