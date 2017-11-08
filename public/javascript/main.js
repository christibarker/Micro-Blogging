
// for ajax call

// auto fill in search bar

// $(function({
// 	${'#user._search'}.keyup(function(e){
// 		let search_term = $(this).val();
// 		if (search_term.length > 1) {
// 			//check if works (1)
// 			// console.log(search_term);
// 			//tests if works(2)
// 			$.post('/search_for_user', {search_term: search_term}, function(results){
// 				// console.log(results);
// 				$('#results'). html(results);

// 			});
// 		}
		
// 	});
// };

//form must have search_for_user for action
//ID user_search

// make a post 
// post '/search_for_user'
// //@user = User.where('name LIKE ?', "%#{params[:search_term]}%")
// end

// check if works
// p @users

// return results
// post '/search_for_user'
// //@user = User.where('name LIKE ?', "%#{params[:search_term]}%")
// erb :search_results, layout: false     //turn off layout

// put on list page use boostrap list group to display info
// div class="list_group"
// <% @User.each do |user| %>
// anchor tag class="list_group_item"> <%= user.name %>
// <% end %>
// 

// place a div around the search input
// and another div id="results"
// /then style in css height & width

// then add an anchor link to take you to their page
// list_group_item_action adds color when hovering
//search wraper position absolute display inline block
// results id  = css positon relative and width 100% top: 37px, left: 20px;




