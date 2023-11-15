dnf module disable nodejs -y &>>/tmp/expense.log
dnf module enable nodejs:18 -y &>>/tmp/expense.log
dnf install nodejs -y &>>/tmp/expense.log
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
useradd expense
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>/tmp/expense.log
cd /app
unzip /tmp/backend.zip &>>/tmp/expense.log
cd /app
npm install
dnf install mysql -y &>>/tmp/expense.log
mysql -h mysql-dev.anjumdevops.online -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload &>>/tmp/expense.log
systemctl enable backend &>>/tmp/expense.log
systemctl restart backend &>>/tmp/expense.log




