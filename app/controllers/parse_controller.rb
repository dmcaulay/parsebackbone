class ParseController < ApplicationController
  
  def index
    @collection = params[:collection] || "posts"
    @config = Parsebackbone::Application.config
    
    sess = create_session
    resp = sess.get @collection.classify

    @values = process_response(resp)["results"]
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { models: @values } }
    end
  end

  def create
    @collection = params[:collection]
    @config = Parsebackbone::Application.config

    new_obj = ActiveSupport::JSON.encode(params[@collection.singularize])
    sess = create_session
    resp = sess.post @collection.classify, new_obj

    @value = process_response resp
        
    respond_to do |format|
      format.json { render json: @value, status: :created, location: @value }
    end
  end

  def show
    @collection = params[:collection]
    id = params[:id]
    @config = Parsebackbone::Application.config
    
    sess = create_session
    resp = sess.get "#{@collection.classify}/#{id}"

    @values = process_response(resp)
        
    respond_to do |format|
      format.json { render json: { model: @value } }
    end
  end

  def update
    @collection = params[:collection]
    id = params[:id]
    @config = Parsebackbone::Application.config

    to_update = params[@collection.singularize]
    to_update.delete('createdAt')
    to_update.delete('updatedAt')
    obj = ActiveSupport::JSON.encode(to_update)
    
    sess = create_session
    resp = sess.put "#{@collection.classify}/#{id}", obj

    @value = process_response resp
        
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def destroy
    @collection = params[:collection]
    id = params[:id]
    @config = Parsebackbone::Application.config

    sess = create_session
    resp = sess.delete "#{@collection.classify}/#{id}"

    @value = process_response resp
        
    respond_to do |format|
      format.json { head :ok }
    end
  end
  
  private
  
  def create_session
    sess = Patron::Session.new
    sess.base_url = @config.parse_base_url
    sess.username = @config.parse_app_id
    sess.password = @config.parse_master_key
    sess.headers['Content-Type'] = 'application/json'
    sess
  end
  
  def process_response(resp)
    if resp.status < 400
      puts "parse response: #{resp.body}"
      ActiveSupport::JSON.decode(resp.body)
    else
      puts "unexpected result from parse: status #{resp.status}, body #{resp.body}"
    end
  end

end
