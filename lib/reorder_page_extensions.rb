module ReorderPageExtensions
  def included(page_base)
    page_base.send(:before_create, :update_position)
  end
  
  def update_position
    last = Page.find(:first, :conditions => { :parent_id => parent_id }, :order => 'position DESC')
    write_attribute('position', last.position + 1) if last
    true
  end

end