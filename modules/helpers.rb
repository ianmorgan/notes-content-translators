
module NotesHelpers
  
  #
  # Wrapper to invoke pygments 
  # syntax highlighting
  #
  class HTMLwithHighlighting < Redcarpet::Render::HTML
    def block_code(code, language)
      if language 
        Pygments.highlight(code, :lexer => language)
      else
        code
      end
    end
  end
  
  #
  # Uses customized version (github) of markdown 
  # with syntax highlighting enabled 
  #
  def markdown_with_pygments(text)
    options ={:hard_wrap => false, 
              :filter_html => true, 
              :autolink => true, 
              :no_intraemphasis => true,     
              :fenced_code_blocks => true, 
              :gh_blockcode => true}
    Redcarpet::Markdown.new(HTMLwithHighlighting.new(:hard_wrap=>false),options).render(text)
  end
  
  #
  #  Allow clients to post data in form, multipart upload or stright POST
  #  
  def extract_posted_data(params)
    uploaded = nil
    if params[:file] != nil
      uploaded = params[:file][:tempfile].read
    end

    if params['payload'] != nil
       uploaded = params['payload'].to_s
    end
    
    uploaded
  end
  
 
end