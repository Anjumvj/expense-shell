 log_file="/tmp/expense.log"
 color="\e[36m"

echo -e "${color} Disable mysql default version \e[om"
dnf module disable mysql -y &>>$log_file
echo $?

echo -e "${color}  Copy Mysql repo file \e[om"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
echo $?

echo -e "${color} Installing mysql server \e[om"
dnf install mysql-community-server -y &>>$log_file
echo $?

echo -e "${color}  Start mysql server \e[om"
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
echo $?

echo -e "${color}  Set Mysql Password \e[om"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
echo $?
