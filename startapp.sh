SHIFTLEFT_SEC_COLLECT_ATTACK_INFO=true sl run -- java -Dshiftleft.sec.xxe=EXTERNAL -Dshiftleft.sec.mode=BLOCK -jar target/helloshiftleft-play-assembly-0.0.1-SNAPSHOT.jar &

sleep 100

for i in {1..100}
do
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/2
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/1
    sleep 60
done
sleep 10
for i in {1..200}
do
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/2
    curl http://localhost:9000/customers/
    curl http://localhost:9000/account/3
    curl http://localhost:9000/account/4
    curl http://localhost:9000/account/5
    curl http://localhost:9000/account/1
    sleep 60
done
sleep 10
for i in {1..150}
do
    curl "http://localhost:9000/rawcustomersbyname/Joe'%20or%20'1'='1"
done
sleep 10
for i in {1..150}
do
    curl "http://localhost:9000/checkAccount/admin/Joe'%20or%20'1'='1"
done
sleep 10
for i in {1..200}
do
    curl http://localhost:9000/account
    curl http://localhost:9000/account/1
    curl http://localhost:9000/account/2
    curl http://localhost:9000/account/3
    curl http://localhost:9000/account/4
    curl http://localhost:9000/account/5
    curl http://localhost:9000/account/1
    sleep 60
done
sleep 5
for i in {1..150}
do
    curl http://localhost:9000/patients
    sleep 30
done
sleep 10
for i in {1..200}
do
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/2
    curl http://localhost:9000/customers/
    curl http://localhost:9000/account/3
    curl http://localhost:9000/account/4
    curl http://localhost:9000/account/5
    curl http://localhost:9000/account/1
    sleep 60
done
sleep 10
for i in {1..50}
do
    curl -X GET --header 'Content-Type: application/xml' --data '<!--?xml version="1.0"?--><!DOCTYPE replace [<!ENTITY ent SYSTEM "file:///etc/passwd">]><userInfo><firstName>Joe</firstName><name>&ent;</name></userInfo>' http://localhost:9000/customersXML
done
sleep 20
for i in {1..200}
do
    curl http://localhost:9000/customers/1
    curl http://localhost:9000/customers/
    curl http://localhost:9000/customers/2
    curl http://localhost:9000/customers/
    curl http://localhost:9000/account/3
    curl http://localhost:9000/account/4
    curl http://localhost:9000/account/5
    curl http://localhost:9000/account/1
    sleep 60
done
sleep 10

