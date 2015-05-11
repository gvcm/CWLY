class ApplicationController < ActionController::Base
  def index
    render nothing: true
  end

  def show
    document = Document.find_by_slug params[:slug]
    return render nothing: true if document.nil? or document.url.blank?
    respond_to do |format|
     format.html { redirect_to document.url_frag, status: :moved_permanently }
     format.json { render json: { data: document.data } }
    end
  end

  def create
    document = Document.create(document_params)
    render json: { slug: document.slug }
  end

  protected

  def document_params
    params.permit(:url, :data)
  end
end
