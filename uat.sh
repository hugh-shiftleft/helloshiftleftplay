SL_FEATURE_FLAG_ENABLED_HTTP=true sl run -- java -Dshiftleft.sec.xxe=EXTERNAL -Dshiftleft.sec.mode=BLOCK -jar target/helloshiftleft-play-assembly-0.0.1-SNAPSHOT.jar
sleep 30
for i in {1..100}
do
    curl http://localhost:8081/customers/1
    curl http://localhost:8081/customers/
    curl http://localhost:8081/customers/2
    curl http://localhost:8081/customers/
    curl http://localhost:8081/customers/1
    curl http://localhost:8081/customers/1
    curl http://localhost:8081/customers/1
    curl http://localhost:8081/customers/1
    sleep 30
done
sleep 10
for i in {1..100}
do
    curl http://localhost:8081/account
    curl http://localhost:8081/account/1
    curl http://localhost:8081/account/2
    curl http://localhost:8081/account/3
    curl http://localhost:8081/account/4
    curl http://localhost:8081/account/5
    curl http://localhost:8081/account/1
    sleep 30
done
sleep 5
for i in {1..50}
do
    curl http://localhost:8081/patients
    sleep 30
done
sleep 10
