module ReorderTagExtensions
  include Radiant::Taggable
  
  desc %{
    Sets page context to next page sibling. For example:

    <pre><code><r:next by="title"><r:link/></r:next></code></pre>

    *Usage:*
    <pre><code><r:next [by="sort_order"]>...</r:next></code></pre>
  }
  tag "next" do |tag|
    by = tag.attr['by'] || "position"
    next_page = Page.find_by_parent_id(tag.locals.page.parent_id, :conditions => ["virtual = false and status_id = 100 and #{by} > ?", tag.locals.page.send(by)], :order => "#{by} ASC")
    if next_page
      tag.locals.page = next_page
      tag.expand
    end
  end

  desc %{
    Sets page context to previous page sibling. For example:
    <pre><code><r:previous by="title"><r:link/></r:previous></code></pre>

    *Usage:*
    <pre><code><r:previous [by="sort_order"]>...</r:previous></code></pre>
  }
  tag "previous" do |tag|
    by = tag.attr['by'] || "position"
    previous_page = Page.find_by_parent_id(tag.locals.page.parent_id, :conditions => ["virtual = false and status_id = 100 and #{by} < ?", tag.locals.page.send(by)], :order => "#{by} DESC")
    if previous_page
      tag.locals.page = previous_page
      tag.expand
    end
  end
  
end