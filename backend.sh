dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y


useradd expense
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install
cp backend.service /etc/systemd/system/backend.service
systemctl daemon-reload
systemctl enable backend
systemctl restart backend
dnf install mysql -y
mysql -h mysql-dev.anjumdevops.online -uroot -pExpenseApp@1 < /app/schema/backend.sql
