class Api::V1::PagesController < Api::V1::ApiController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_url, only: [:get_content]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    respond_to do |format|
      if @pages.count > 0
        format.json { render json: {urls: @pages} }
      else
        format.json { render json: {errors: 404, message: "no url found"} }
      end
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end
  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.json { render json: {status: :saved, message: "Page content was successfully saved."} }
      else
        format.json { render json: {errors: @page.errors, status: :unprocessable_entity} }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_content
    respond_to do |format|
      if @url.present?
        format.json { render json: {data: @url} }
      else
        format.json { render json: {errors: "no record found"} }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def set_url
      @url = Page.find_by(url: params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:url)
    end
end
