${'#sign_in'}.on('click' function(
	${'#sign_in'}.html('logout');
	${'#create_account'}.text(''); 
	);

${'#create_account_button'}.on('click' function(
	${'#create_account'}.text('logout');
	${'#sign_in'}.text('');
	);
