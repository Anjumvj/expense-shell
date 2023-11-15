
echo -e "\e[36m Installing Nginx \e[om"
dnf install nginx -y &>>/tmp/expense.log
systemctl enable nginx &>>/tmp/expense.log

echo -e "\e[34m Starting Nginx \e[om"
systemctl start nginx

echo -e "\e[36m Copy Expense Config file \e[om"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[35m clean old Nginx command \e[om"
rm -rf /usr/share/nginx/html/*

echo -e "\e[31m Download frontend Application code \e[om"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[36m Extract downloaded Application content code \e[om"
cd /usr/share/nginx/html

unzip /tmp/frontend.zip

systemctl restart nginx
