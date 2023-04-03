resource "aws_autoscaling_attachment" "asg_alb_attach" {
  autoscaling_group_name = aws_autoscaling_group.visualtech_asg.id
  lb_target_group_arn    = aws_lb_target_group.alb_targetgroup.arn
}