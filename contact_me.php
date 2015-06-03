<?php
	
$name = $_GET['name'];
$email_address = $_GET['email'];
$message = $_GET['message'];

echo $name;
echo $email_address;
echo $message;
$to = 'jayesh.kava007@gmail.com'; //Just write your email
$email_subject = "Contact form submitted by:  $name";
$email_body = "You have received a new message. <br/>".
			  "Here are the details: <br/><br/> Name: $name <br/><br/>".
		      "Email: $email_address <br/><br/> Message: <br/> $message";
$headers="From:<$email_address>\n";
$headers.="Content-Type:text/html; charset=UTF-8";
if($email_address != "") {
	mail($to,$email_subject,$email_body,$headers);
	return true;
}

?>