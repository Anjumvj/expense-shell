
echo -e "\e[36m Enable nodejs \e[om"
dnf module disable mysql -y

echo -e "\e[36m Enable nodejs \e[om"
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m Installing mysql \e[om"
dnf install mysql-community-server -y

echo -e "\e[36m Enable mysql \e[om"
systemctl enable mysqld

echo -e "\e[36m start nodejs \e[om"
systemctl start mysqld

echo -e "\e[36m password \e[om"
mysql_secure_installation --set-root-pass ExpenseApp@1
