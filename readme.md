This is a brief explanation for my test answer

VPC created with 2 public subnets and 2 private subnets, the ALB will be deployed on the public subnet to be available for the external clients and the ec2 which is hosting the web application will be deployed in the private subnet.

The security group is created to just allow a specific connection on a particular port, by default the port is 80 but you are free to assign another port from the module root module.

As I'm implementing a web application so one of the best practices is two configure an autoscaling group so when the number of the clients accessing the website increases, the number ec2 instances hosting that website will be increased too.

The web application used here is a very simple app, you can change the Github link in the .sh script to install another web application.

You can access the home page of the application just by typing the ALB URL following by /web as the clone done in that directory, also Developers are free to change that directory easily :D

The minimum size for the autoscaling group is 2 as recommended in the test mail. developer can change the min and max number assigned to the autoscaling group from the root module.