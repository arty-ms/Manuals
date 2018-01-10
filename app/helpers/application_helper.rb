module ApplicationHelper
	def markdown(text)
		
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
			autolink: true, tables: true, no_intra_emphasis: true, fenced_code_blocks: true, 
			superscript: true, strikethrough: true, space_after_headers: true,
			disable_indented_code_blocks:true,lax_html_blocks: true, highlight: true)
		return markdown.render(text).html_safe
	end
	
end
