#! /bin/bash
hostnamectl set-hostname ${server-name}
#update os
yum update -y
#install apache server
yum install -y httpd
# get date and time of server
DATE_TIME=`date`
# create a custom index.html file
echo "<html>
<head>
    <title> My First Web Server</title>
</head>
<body>
    <h1>Hello to Everyone from My First Web Server</h1>
    <p>This instance is created at <b>$DATE_TIME</b></p>
</body>
</html>" > /var/www/html/index.html
# start apache server
systemctl start httpd
systemctl enable httpd
echo 'export PS1="\[\e[1;34m\]\u\[\e[33m\]@\h# \W:\[\e[32m\]\\$\[\e[m\] "' >> /home/ec2-user/.bashrc