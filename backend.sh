 log_file="/tmp/expense.log"


echo -e "\e[36m Disable nodejs default version \e[om"
dnf module disable nodejs -y &>>$log_file
echo $?

echo -e "\e[36m Enable nodejs 18 version  \e[om"
dnf module enable nodejs:18 -y &>>$log_file
echo $?

echo -e "\e[36m Installing nodejs \e[om"
dnf install nodejs -y&>>$log_file
echo $?

echo -e "\e[36m copy backend service file \e[om"
cp backend.service /etc/systemd/system/backend.service &>>$log_file
echo $?

echo -e "\e[36m Add Application User \e[om"
useradd expense &>>$log_file
echo $?

echo -e "\e[36m Create Directory \e[om"
mkdir /app &>>$log_file
echo $?

echo -e "\e[36m Delete Old Application Content \e[om"
rm -rf /app/* &>>$log_file
echo $?


echo -e "\e[36m Download Application Content \e[om"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>$log_file
echo $?


echo -e "\e[36m Extract Application Content \e[om"
cd /app &>>$log_file
unzip /tmp/backend.zip &>>$log_file
echo $?

echo -e "\e[36m Download NodeJs Dependencies \e[om"
npm install &>>$log_file
echo $?

echo -e "\e[36m Installing mysql client to Load schema \e[om"
dnf install mysql -y &>>$log_file
echo $?

echo -e "\e[36m Load schema \e[om"
mysql -h mysql-dev.anjumdevops.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
echo $?

echo -e "\e[36m Starting backend service \e[om"
systemctl daemon-reload &>>/tmp/expense.log &>>$log_file
systemctl enable backend &>>/tmp/expense.log &>>$log_file
systemctl restart backend &>>/tmp/expense.log &>>$log_file
echo $?




