class ApplicationController < ActionController::Base
  before_filter :document, only: :show
  before_filter :cors, only: [ :show, :create ]

  def index
    render nothing: true
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
    @document.url = params[:url]
    @document.data = params[:data]
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
      if @document
        if origin.index(@document.origin)===0
          headers['Access-Control-Allow-Origin'] = @document.origin
        end
      else
        headers['Access-Control-Allow-Origin'] = '*'
      end
    end
  end

end
