class ApplicationController < ActionController::Base
  before_filter :document, only: :show
  before_filter :cors, only: [ :show, :create ]

  def index
    qs = params[:qs]
    qv = params[:qv]
    start = params[:start] || 0
    @documents = Document
    @documents = @documents.containing_text(JSON.parse(qs)) if qs
    @documents = @documents.containing_values(JSON.parse(qv)) if qv
    @documents = @documents.order(updated_at: :desc).limit(10).offset(start).all
    respond_to do |format|
     format.html { render nothing: true }
     format.json { render json: { documents: @documents } }
    end
  end

  def show
    return render nothing: true if @document.nil? or @document.url.blank?
    respond_to do |format|
     format.html { redirect_to @document.destination, status: :moved_permanently }
     format.json { render json: { data: @document.data } }
    end
  end

  def create
    @document = Document.new
    begin
      @document.url = params[:url] unless params[:url].empty?
    rescue Exception => e
      return render json: { error: e.message }, status: :bad_request
    end
    begin
      @document.data = JSON.parse(params[:data]) unless params[:data].empty?
    rescue Exception => e
      return render json: { error: e.message }, status: :bad_request
    end
    if @document.save
      render json: { slug: @document.slug }
    else
      render nothing: true, status: :service_unavailable
    end
  end

  protected

  def document
    @document = Document.find_by_slug params[:slug]
  end

  def cors
    origin = request.headers['Origin']
    unless origin.blank?
      headers['Access-Control-Allow-Origin'] = '*'
    end
  end
  
end
