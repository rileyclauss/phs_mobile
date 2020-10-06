<?php

$data = array(
    $_POST['title'],
    $_POST['body']
);

// Open file in append mode
if (strcmp($_POST['password'],"password") == 0) {
    //TODO change password for prod
    $fp = fopen('notifications.csv', 'a');
    // Append input data to the file
    fputcsv($fp, $data);
    // close the file
    fclose($fp);
    echo "Data successfully written";
}else{
    echo "Password incorrect";
}
