
echo -e "\e[36m Installing Nginx \e[om"
dnf install nginx -y &>>/tmp/expense.log
systemctl enable nginx &>>/tmp/expense.log
echo $?

echo -e "\e[36m Starting Nginx \e[om"
systemctl start nginx &>>/tmp/expense.log
echo $?

echo -e "\e[36m Copy Expense Config file \e[om"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo $?

echo -e "\e[36m clean old Nginx command \e[om"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo $?

echo -e "\e[36m Download frontend Application code \e[om"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo $?

echo -e "\e[36m Extract downloaded Application content code \e[om"
cd /usr/share/nginx/html &>>/tmp/expense.log
echo $?

unzip /tmp/frontend.zip &>>/tmp/expense.log
echo $?

systemctl restart nginx &>>/tmp/expense.log
echo $?
