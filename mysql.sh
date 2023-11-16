 log_file="/tmp/expense.log"
 color="\e[36m"
status_check () {
  if [ $? -eq 0 ]; then
                 echo -e "\e[36m SUCCESS \e[om"
               else
                 echo -e "\e[36m FAILURE \e[om"
                 fi
                 }
echo -e "${color} Disable mysql default version \e[om"
dnf module disable mysql -y &>>$log_file
status_check

echo -e "${color}  Copy Mysql repo file \e[om"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
status_check

echo -e "${color} Installing mysql server \e[om"
dnf install mysql-community-server -y &>>$log_file
status_check

echo -e "${color}  Start mysql server \e[om"
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
status_check

echo -e "${color}  Set Mysql Password \e[om"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
status_check

