$(function() {
	$('#reviewspaginate').pajinate({
		items_per_page : 10,
		num_page_links_to_display : 5,
		abort_on_small_lists: true,
		item_container_id : '.alt_content',
		nav_panel_id : '.alt_page_navigation'
		
	});
});	
